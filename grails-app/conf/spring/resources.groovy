import tp_mbds_grails.SecUserPasswordEncoderListener
import tp_mbds_grails.SecUserPasswordEncoderListener
import tp_mbds_grails.UserPasswordEncoderListener
import tp_mbds_grails.SecUserPasswordEncoderListener
import tp_mbds_grails.SecUserPasswordEncoderListener
import tp_mbds_grails.UserPasswordEncoderListener
import tp_mbds_grails.UserPasswordEncoderListener
import tp_mbds_grails.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener, ref('hibernateDatastore'))
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener, ref('hibernateDatastore'))
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
}
