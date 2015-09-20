Template.postSubmit.events(
    "submit form": (e, t) ->
        e.preventDefault()
        console.log("Test")
        post = 
            url:  t.find("[name=url]").value
            title:  t.find("[name=title]").value
        
        Meteor.call("postInsert", post, (error, result) ->
            if error
                return alert(error.reason)
            Router.go("postPage", _id: result._id)
        )
)