/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the world's best digital lab notebook"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var CoursesPage = {
  template: "#courses-page",
  data: function() {
    return {
      coursesAttending: [],
      coursesNotAttending: [],
      errors: [],
      role: ""
    };
  },
  created: function() {
    axios.get('/api/courses').then(function(response) {

      this.coursesAttending = response.data.courses_attending;
      this.coursesNotAttending = response.data.courses_not_attending;
      this.role = response.data.role;

    }.bind(this));
  },
  methods: {},
  computed: {}
};

var CoursesShowPage = {
  template: "#courses-show-page",
  data: function() {
    return {
      course: [],
      errors: []
    };
  },
  created: function() {
    axios.get("/api/courses/" + this.$route.params.id).then(function(response) {
      // console.log(response.data);
      this.course = response.data;
      // console.log(this.course);
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        teacher_id: this.course.teacher_id,
        course_id: this.course.id
      };

      axios
        .post("/api/student_teacher_pairs", params)
        .then(function(response) {
          router.push("/courses");
        })
        .catch(
          function(error) {
            error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var CoursesNewPage = {
  // template: "#courses-new-page",
  // data: function() {
  //   return {
  //     className: "",
  //     description: "",
  //     errors: []
  //   };
  // },
  // created: {},
  // methods: {
  //   submit: function() {
  //     var params = {
  //       name: this.className,
  //       description: this.description
  //     };

  //     axios
  //       .post("/api/courses", params)
  //       .then(function(response) {
  //         router.push("/courses");
  //       })
  //       .catch(
  //         function(error) {
  //           error.response.data.errors;
  //         }.bind(this)
  //       );
  //   }
  // },
  // computed: {}
};

var TeacherSignupPage = {
  template: "#teacher-signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/teachers", params)
        .then(function(response) {
          router.push("/teacher-login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var TeacherLoginPage = {
  template: "#teacher-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/teacher_sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/courses");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var StudentSignupPage = {
  template: "#student-signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/students", params)
        .then(function(response) {
          router.push("/student-login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var StudentLoginPage = {
  template: "#student-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/student_sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/courses");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/courses", component: CoursesPage },
    { path: "/teacher-signup", component: TeacherSignupPage },
    { path: "/teacher-login", component: TeacherLoginPage },    
    { path: "/student-signup", component: StudentSignupPage },
    { path: "/student-login", component: StudentLoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/courses/new", component: CoursesNewPage },
    { path: "/courses/:id", component: CoursesShowPage },
  ], 
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    console.log('jwt');
    console.log(jwt);
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});