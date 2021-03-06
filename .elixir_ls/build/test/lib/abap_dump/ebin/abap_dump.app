{application,abap_dump,
             [{applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             gettext,phoenix_pubsub,cowboy,phoenix_html,
                             ueberauth,ueberauth_google,phoenix,postgrex,
                             ex_machina,veil,phoenix_ecto]},
              {description,"abap_dump"},
              {modules,['Elixir.AbapDump','Elixir.AbapDump.Application',
                        'Elixir.AbapDump.DataCase','Elixir.AbapDump.Factory',
                        'Elixir.AbapDump.Repo','Elixir.AbapDump.TAD',
                        'Elixir.AbapDump.TAD.Pearl','Elixir.AbapDump.User',
                        'Elixir.AbapDump.Veil','Elixir.AbapDump.Veil.Clean',
                        'Elixir.AbapDump.Veil.Request',
                        'Elixir.AbapDump.Veil.Session',
                        'Elixir.AbapDump.Veil.User','Elixir.AbapDumpWeb',
                        'Elixir.AbapDumpWeb.AuthController',
                        'Elixir.AbapDumpWeb.ChannelCase',
                        'Elixir.AbapDumpWeb.ConnCase',
                        'Elixir.AbapDumpWeb.Endpoint',
                        'Elixir.AbapDumpWeb.ErrorHelpers',
                        'Elixir.AbapDumpWeb.ErrorView',
                        'Elixir.AbapDumpWeb.Gettext',
                        'Elixir.AbapDumpWeb.LayoutView',
                        'Elixir.AbapDumpWeb.PageController',
                        'Elixir.AbapDumpWeb.PageView',
                        'Elixir.AbapDumpWeb.PearlController',
                        'Elixir.AbapDumpWeb.PearlView',
                        'Elixir.AbapDumpWeb.Plugs.SetUser',
                        'Elixir.AbapDumpWeb.Plugs.Veil.Authenticate',
                        'Elixir.AbapDumpWeb.Plugs.Veil.User',
                        'Elixir.AbapDumpWeb.Plugs.Veil.UserId',
                        'Elixir.AbapDumpWeb.PostController',
                        'Elixir.AbapDumpWeb.PostView',
                        'Elixir.AbapDumpWeb.Router',
                        'Elixir.AbapDumpWeb.Router.Helpers',
                        'Elixir.AbapDumpWeb.UserSocket',
                        'Elixir.AbapDumpWeb.Veil.EmailView',
                        'Elixir.AbapDumpWeb.Veil.ErrorView',
                        'Elixir.AbapDumpWeb.Veil.FallbackController',
                        'Elixir.AbapDumpWeb.Veil.LoginEmail',
                        'Elixir.AbapDumpWeb.Veil.Mailer',
                        'Elixir.AbapDumpWeb.Veil.SessionController',
                        'Elixir.AbapDumpWeb.Veil.SessionView',
                        'Elixir.AbapDumpWeb.Veil.UserController',
                        'Elixir.AbapDumpWeb.Veil.UserView']},
              {registered,[]},
              {vsn,"0.0.1"},
              {mod,{'Elixir.AbapDump.Application',[]}},
              {extra_applications,[logger,runtime_tools]}]}.
