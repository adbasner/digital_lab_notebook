var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message1: "Welcome to the online digital lab notebook",
      message2: "A free resource that is ideal for educational lab courses."
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};
 
// ******************************
// Course Crud
// ******************************

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
      course: {},
      errors: [],
      role: "",
      labs: [],
      courseId: this.$route.params.id
    };
  },
  created: function() {
    axios.get("/api/courses/" + this.courseId).then(function(response) {
      this.course = response.data;
      this.role = response.data.role;
      this.labs = response.data.labs;
    }.bind(this));
  },
  methods: {
  },
  computed: {}
};

var CoursesJoinPage = {
  template: "#courses-join-page",
  data: function() {
    return {
      course: [],
      errors: [],
      role: ""
    };
  }, 
  created: function() {
    axios.get("/api/courses/" + this.$route.params.id).then(function(response) {
      this.course = response.data;
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
  template: "#courses-new-page",
  data: function() {
    return {
      className: "",
      description: "",
      errors: []
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        name: this.className,
        description: this.description
      };

      axios
        .post("/api/courses", params)
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

var CoursesEditPage = {
  template: "#courses-edit-page",
  data: function() {
    return {
      className: "",
      description: "",
      errors: [],
      id: this.$route.params.id
    };
  },
  created: function() {
    axios.get("/api/courses/" + this.$route.params.id).then(function(response) {
      this.course = response.data;
      this.className = response.data.name;
      this.description = response.data.description;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        name: this.className,
        description: this.description
      };
      var route = "/courses/" + this.id;
      axios
        .patch("/api/courses/" + this.$route.params.id, params)
        .then(function(response) {
          router.push(route);
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

var CoursesDeletePage = {
  template: "#courses-delete-page",
  data: function() {
    return {
      course: {},
      errors: [],
      role: ""
    };
  },
  created: function() {
    axios.get("/api/courses/" + this.$route.params.id).then(function(response) {
      this.course = response.data;
      this.description = response.data.description;
    }.bind(this));
  },
  methods: {
    submit: function() {
      axios
        .delete("/api/courses/" + this.$route.params.id)
        .then(function(response) {
          router.push("/courses");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

// ******************************
// Lab Crud
// ******************************

var LabsNewPage = {
  template: "#labs-new-page",
  data: function() {
    return {
      labName: "",
      courseId: this.$route.params.id,
      errors: []
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        title: this.labName,
        course_id: this.courseId
      };
      var id = this.courseId;
      axios
        .post("/api/labs", params)
        .then(function(response) {
          router.push("/courses/" + id);
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

var LabsShowPage = {
  template: "#labs-show-page",
  data: function() {
    return {
      lab: {},
      errors: [],
      role: "",
      notebookSections: []
    };
  },
  created: function() {
    var sections = [];
    axios.get("/api/labs/" + this.$route.params.id).then(function(response) {
      this.lab = response.data.lab;
      this.notebookSections = response.data.notebook_sections;
      this.role = response.data.role;
    }.bind(this));
    
  },
  methods: {},
  computed: {}
};

var LabsEditPage = {
  template: "#labs-edit-page",
  data: function() {
    return {
      labName: "",
      errors: [],
      id: this.$route.params.id
    };
  },
  created: function() {
    axios.get("/api/labs/" + this.$route.params.id).then(function(response) {
      this.labName = response.data.lab.title;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        title: this.labName,
        
      };
      var route = "/labs/" + this.id;
      axios
        .patch("/api/labs/" + this.id, params)
        .then(function(response) {
          router.push(route);
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

var LabsDeletePage = {
  template: "#labs-delete-page",
  data: function() {
    return {
      lab: {},
      errors: [],
      role: ""
    };
  },


  // "/courses/:id/labs/:labid/delete",
  created: function() {
    axios.get("/api/labs/" + this.$route.params.labid).then(function(response) {
      this.lab = response.data.lab;
      this.description = response.data.description;
    }.bind(this));
  },
  methods: {
    submit: function() {
      axios
        .delete("/api/labs/" + this.$route.params.labid)
        .then(function(response) {
          router.push("/courses/" + this.$route.params.id);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

// ******************************
// Notebook Sections Crud
// ******************************

var NoteboookSectionNewPage = {
  template: "#notebook-section-new-page",
  data: function() {
    return {
      heading: "",
      datum: "",
      canEdit: "",
      errors: [],
      priority: ""
    };
  },
  created: function() {
  },
  methods: {
    submit: function() {
      var params = {
        heading: this.heading,
        datum: this.datum,
        student_can_edit: this.canEdit,
        lab_id: this.$route.params.id,
        priority: this.priority,
      };

      axios
        .post("/api/notebook_sections", params)
        .then(function(response) {
          router.push("/labs/" + this.$route.params.id);
        }.bind(this))
        .catch(
          function(error) {
            error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var NoteboookSectionEditPage = {
  template: "#notebook-section-edit-page",
  data: function() {
    return {
      heading: "",
      datum: "",
      canEdit: "",
      priority: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/notebook_sections/" + this.$route.params.nbsid).then(function(response) {
      this.heading = response.data.heading;
      this.datum = response.data.datum;
      this.canEdit = response.data.student_can_edit;
      this.priority = response.data.priority;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        heading: this.heading,
        datum: this.datum,
        student_can_edit: this.canEdit,
        lab_id: this.$route.params.id,
        priority: this.priority,
      };

      axios
        .patch("/api/notebook_sections/" + this.$route.params.nbsid, params)
        .then(function(response) {
          router.push("/labs/" + this.$route.params.id);
        }.bind(this))
        .catch(
          function(error) {
            error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var NoteboookSectionDeletePage = {
  template: "#notebook-section-delete-page",
  data: function() {
    return {
      heading: "",
      datum: "",
      canEdit: "",
      labId: "",
      nbsId: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/notebook_sections/" + this.$route.params.nbsid).then(function(response) {
      this.heading = response.data.heading;
      this.datum = response.data.datum;
      this.canEdit = response.data.student_can_edit;
      this.labId = this.$route.params.id;
      this.nbsId = this.$route.params.nbsid;

    }.bind(this));
  },
  methods: {
    submit: function() {
      axios
        .delete("/api/notebook_sections/" + this.nbsId)
        .then(function(response) {
          router.push("/labs/" + this.labId);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var NoteboookDataNewPage = {
  template: "#notebook-data-new-page",
  data: function() {
    return {
      datum: "",
      errors: [],
      heading: "",
      notebookData: ""
      // "notebook_section_id"
    };
  },
  created: function() {
    axios.get("/api/notebook_sections/" + this.$route.params.nbsid).then(function(response) {
      this.heading = response.data.heading;
      this.datum = response.data.datum;
      this.canEdit = response.data.student_can_edit;
      this.labId = this.$route.params.id;
      this.nbsId = this.$route.params.nbsid;

    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        datum: this.notebookData,
        notebook_section_id: this.nbsId
      };

      axios
        .post("/api/notebook_data", params)
        .then(function(response) {
          router.push("/labs/" + this.labId);
        }.bind(this))
        .catch(
          function(error) {
            error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

// ******************************
// Authentication
// ******************************

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

// ******************************
// Vue Stuff
// ******************************

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/teacher-signup", component: TeacherSignupPage },
    { path: "/teacher-login", component: TeacherLoginPage },    
    { path: "/student-signup", component: StudentSignupPage },
    { path: "/student-login", component: StudentLoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/courses", component: CoursesPage },
    { path: "/courses/new", component: CoursesNewPage },
    { path: "/courses/:id", component: CoursesShowPage },
    { path: "/courses/:id/edit", component: CoursesEditPage },
    { path: "/courses/:id/delete", component: CoursesDeletePage },
    { path: "/courses/:id/join", component: CoursesJoinPage },
    { path: "/courses/:id/labs/new", component: LabsNewPage },
    { path: "/labs/:id", component: LabsShowPage },
    { path: "/labs/:id/edit", component: LabsEditPage },
    { path: "/courses/:id/labs/:labid/delete", component: LabsDeletePage },
    { path: "/labs/:id/notebook/new", component: NoteboookSectionNewPage },
    { path: "/labs/:id/notebook/:nbsid/edit", component: NoteboookSectionEditPage },
    { path: "/labs/:id/notebook/:nbsid/delete", component: NoteboookSectionDeletePage },
    { path: "/labs/:id/notebook/:nbsid/notebookdata/new", component: NoteboookDataNewPage },

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
    // console.log('jwt');
    // console.log(jwt);
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});