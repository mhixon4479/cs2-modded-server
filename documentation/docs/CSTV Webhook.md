---
hide:
  -toc
---
# :bootstrap-CSTV: CSTV Webhook

### Getting Started
After running your server, look for the config `/configs/plugins/CS2-GOTV-Discord/CS2-GOTV-Discord.json`.<br>

You will add your discord webhook URL, mega login/password, and configure the rest of the settings to your liking. Keep in mind that discord filesize limits are `100MB` for webhooks, and mega has a 1TB data cap.<br>

I have opted for this to be enabled by default, as it will only interfere if you have plugins always trying to run records, or users in the community abusing the chat commands available with the plugin. If you wish to disable the plugin, just apply `css_plugins unload CS2-GOTV-Discord` to your custom_all.cfg

As of May 2024, these are the recommended settings for your CSTV:
```
tv_enable 1
tv_name "Cool CSTV"
tv_relayvoice 1
tv_delaymapchange 1
tv_port 27020
tv_delay 0
```

!!! info "MatchZy"
    MatchZy comes with it's own settings for the CSTV. It is always recommended to keep it's CSTV settings at default.