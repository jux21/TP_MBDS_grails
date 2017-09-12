package tp_mbds_grails

abstract class UserRole {

    User user;
    RoleAdmin roleAdmin;
    RoleModer roleModer;
    RoleUtil roleUtil;

    static constraints = {
    }
}
