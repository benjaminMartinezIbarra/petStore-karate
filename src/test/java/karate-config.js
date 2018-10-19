function(){
    var env = karate.env //-DKarate.env
    var mode = karate.properties["karate.mode"] //-Dkarate.mode

    if (!env) {
        env = 'dev'
    }

    if (!mode) {
        mode = 'sandbox'
    }

    var config = {
        'env' : env,
        'mode': mode
    }

    switch(env) {
        case 'dev':
            config.petstoreApiBase = "http://localhost:9090"
            break
    }

    karate.configure('connectTimeout', 5000)

    karate.log('config:', JSON.stringify(config, null, 2));

    return config

}