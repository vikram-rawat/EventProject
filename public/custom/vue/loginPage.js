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
        Show: {
            SubmitBtns: false,
            Services: false,
            Locations: false
        },
        Value: {
            States: "",
            Locations: "",
            Services: ""
        },
        ApiData: {
            MainJson: [],
            States: [],
            Locations: [],
            Services: []
        }
    },
    methods: {
        searchformSubmit: function () {}
    },
    mounted: function () {
        this.ApiData.MainJson = $.getJSON("/json/api/states");
        let s = [];
        this.ApiData.MainJson.then(data => {
            this.ApiData.States = data;
        });
    },
    computed: {},
    watch: {
        "Value.States": function (newValue, oldValue) {

            this.mainTheme.stateTheme.m6 = true
            this.mainTheme.stateTheme.l6 = true
            this.mainTheme.stateTheme.m12 = false
            this.mainTheme.stateTheme.l12 = false
            this.Show.Locations = true;
            $.getJSON("/json/api/locations", {
                state: newValue
            }).then(data => {
                this.ApiData.Locations = data;
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
                        this.Value.Locations = event[0].M_Chips.chipsData;
                    },
                    onChipDelete: (event, chip) => {
                        this.Value.Locations = event[0].M_Chips.chipsData;
                    }
                });
            });
        },
        "Value.Locations": function (newValue, oldValue) {
            if (this.Value.Locations.length != 0) {
                this.Show.Services = true;
            } else {
                this.Show.Services = false;
            }
            $.getJSON("/json/api/services").then(data => {
                this.ApiData.Services = data;
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
                        this.Value.Services = event[0].M_Chips.chipsData;
                    },
                    onChipDelete: (event, chip) => {
                        this.Value.Services = event[0].M_Chips.chipsData;
                    }
                });
            });
        },
        "Value.Services": function (newValue, oldValue) {
            if (this.Value.Services.length != 0) {
                this.Show.SubmitBtns = true;
            } else {
                this.Show.SubmitBtns = false;
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