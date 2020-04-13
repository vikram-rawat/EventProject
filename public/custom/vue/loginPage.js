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
            $.getJSON("/json/api/verifyuser", {
                userid: this.Input.userID
            }).then(data => {
                this.Value.verifiedUser = data;
            });
        }
    },
    mounted: function () {},
    computed: {},
    watch: {}
});