Router.configure(
    layoutTemplate: "layout"
    loadingTemplate: "loading"
    waitOn: ->
        return Meteor.subscribe("posts")
    notFoundTemplate: "notFound"    
)
    
Router.route("/",
    name: "postsList"
)
  
Router.route("/posts/:_id",
    name: "postPage"
    data: ->
        return Posts.findOne(this.params._id);
)
 
Router.route("/submit", 
    name: "postSubmit"
)

requireLogin = ->
    if ! Meteor.user()
        this.render "accessDenied"
    else
        this.next()
 
Router.onBeforeAction( "dataNotFound",
    only: "postPage"
)

Router.onBeforeAction(requireLogin, 
    only: "postSubmit"
) 
