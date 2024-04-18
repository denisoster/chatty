import Config

config :n2o,
       port: 8002,
       app: :chatty,
       pickler: :n2o_secret,
       mq: :n2o_syn,
       nitro_prolongate: true,
       ttl: 60,
       protocols: [:nitro_n2o],
       routes: Chatty.Routes
