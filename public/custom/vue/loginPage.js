var loginForm = new Vue({
    el: "#loginifo",
    delimiters: ["{%%", "%%}"],
    data: {
        mainTheme: {},
        Show: {
            loginForm: true,
            userCheck: false
        },
        Input: {
            userID: ""
        },
        Value: {
            verifiedUser: {
                "UserExists": true
            }
        },
        ApiData: {}
    },
    methods: {
        verifyuser: function () {
            if(this.Input.userID.length > 6 ){
                $.getJSON("/json/api/verifyuser", {
                    userid: this.Input.userID
                }).then(data => {
                    this.Value.verifiedUser = data;
                });    
            } else {
                M.toast({html: 'Choose a UserName at least 7 letters ', classes: 'red rounded lighten-3'});
            }
        }
    },
    mounted: function () {},
    computed: {},
    watch: {}
});