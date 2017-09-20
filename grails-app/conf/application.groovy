

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'tp_mbds_grails.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'tp_mbds_grails.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'tp_mbds_grails.SecRole'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/error',          access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/index',          access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/shutdown',       access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/assets/**',      access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/**/js/**',       access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/**/css/**',      access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/**/images/**',   access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/**/favicon.ico', access: ['IS_AUTHENTICATED_FULLY']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]


