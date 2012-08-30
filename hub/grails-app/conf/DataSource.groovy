grails {
    mongo {
        host = "ds033257.mongolab.com"
        port = 33257
        username = "webapp"
        password = "webapp465"
        databaseName = "cachirulohub"
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        
    }
    test {
        
    }
    production {
        grails {
            mongo{
                host = "ds035997.mongolab.com"
                port = 35997
                password = "webapp321"
                databaseName = "cachirulohub_production"
            }
        }
    }
}
