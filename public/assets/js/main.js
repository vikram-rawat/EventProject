var searchEngine = new Vue({
  el: "#searchTab",
  delimiters: ["{%%", "%%}"],
  data: {
    mainTheme: {
      stateTheme: {
        m6: false,
        l6: false,
        m12: true,
        l12: true
      }
    },
    mainJson: [],
    states: [],
    locations: [],
    services: [],
    showLocations: false,
    showServices: false,
    showBtns: false,
    statesValue: "",
    locationsValue: "",
    servicesValue: ""
  },
  methods: {
    searchformSubmit: function () {
      console.log(this.statesValue);
      console.log(this.locationsValue);
      console.log(this.servicesValue);
    }
  },
  mounted: function () {
    this.mainJson = $.getJSON("/json/api/states");
    let s = [];
    this.mainJson.then(data => {
      this.states = data;
    });
  },
  computed: {},
  watch: {
    statesValue: function (newValue, oldValue) {
      this.mainTheme.stateTheme.m6 = true
      this.mainTheme.stateTheme.l6 = true
      this.mainTheme.stateTheme.m12 = false
      this.mainTheme.stateTheme.l12 = false
      this.showLocations = true;
      $.getJSON("/json/api/locations", {
        state: newValue
      }).then(data => {
        this.locations = data;
        var storeDict = {};
        $.each(data, (i, v) => {
          storeDict[v.LocationName] = null;
        });
        $(".chips-districts").chips({
          placeholder: "Search a City or District",
          secondaryPlaceholder: "+Add Location",
          autocompleteOptions: {
            data: storeDict,
            limit: Infinity,
            minLength: 1
          },
          onChipAdd: (event, chip) => {
            this.locationsValue = event[0].M_Chips.chipsData;
          },
          onChipDelete: (event, chip) => {
            this.locationsValue = event[0].M_Chips.chipsData;
          }
        });
      });
    },
    locationsValue: function (newValue, oldValue) {
      if (this.locationsValue.length != 0) {
        this.showServices = true;
      } else {
        this.showServices = false;
      }
      $.getJSON("/json/api/services").then(data => {
        this.services = data;
        var serviceDict = {};
        $.each(data, (i, v) => {
          serviceDict[v.ServicesName] = null;
        });
        // create a chipset for local marriages
        $(".chips-searchItem").chips({
          placeholder: "Search any service or product",
          secondaryPlaceholder: "+Add more Services",
          autocompleteOptions: {
            data: serviceDict,
            limit: Infinity,
            minLength: 1
          },
          onChipAdd: (event, chip) => {
            this.servicesValue = event[0].M_Chips.chipsData;
          },
          onChipDelete: (event, chip) => {
            this.servicesValue = event[0].M_Chips.chipsData;
          }
        });
      });
    },
    servicesValue: function (newValue, oldValue) {
      if (this.servicesValue.length != 0) {
        this.showBtns = true;
      } else {
        this.showBtns = false;
      }
    }
  }
});

var searchResults = new Vue({
  el: "#searchResult",
  delimiters: ["{%%", "%%}"],
  data: {
    showDiv: false
  }
});