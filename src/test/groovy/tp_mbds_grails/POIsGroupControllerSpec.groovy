package tp_mbds_grails

import grails.test.mixin.*
import spock.lang.*

@TestFor(POIsGroupController)
@Mock(POIsGroup)
class POIsGroupControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.POIsGroupList
            model.POIsGroupCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.POIsGroup!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def POIsGroup = new POIsGroup()
            POIsGroup.validate()
            controller.save(POIsGroup)

        then:"The create view is rendered again with the correct model"
            model.POIsGroup!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            POIsGroup = new POIsGroup(params)

            controller.save(POIsGroup)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/POIsGroup/show/1'
            controller.flash.message != null
            POIsGroup.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def POIsGroup = new POIsGroup(params)
            controller.show(POIsGroup)

        then:"A model is populated containing the domain instance"
            model.POIsGroup == POIsGroup
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def POIsGroup = new POIsGroup(params)
            controller.edit(POIsGroup)

        then:"A model is populated containing the domain instance"
            model.POIsGroup == POIsGroup
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/POIsGroup/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def POIsGroup = new POIsGroup()
            POIsGroup.validate()
            controller.update(POIsGroup)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.POIsGroup == POIsGroup

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            POIsGroup = new POIsGroup(params).save(flush: true)
            controller.update(POIsGroup)

        then:"A redirect is issued to the show action"
            POIsGroup != null
            response.redirectedUrl == "/POIsGroup/show/$POIsGroup.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/POIsGroup/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def POIsGroup = new POIsGroup(params).save(flush: true)

        then:"It exists"
            POIsGroup.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(POIsGroup)

        then:"The instance is deleted"
            POIsGroup.count() == 0
            response.redirectedUrl == '/POIsGroup/index'
            flash.message != null
    }
}
