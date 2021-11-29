# Custom Scheme Link
[Project created with Xcode V11.4]
[Deployment Target > 11.0 ]

## Project Base.
## Documentation
* [Defining a Custom URL Scheme for Your App](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app)

### Configuring the App
1. Select the "CustomSchemaLinks" project (Navigator menu)
1. Select the "CustomSchemaLinks" target
1. Select the "Info" Section
1. In URL Types Section, press + and add your scheme:
* [ ] Identifier: Your bundle ID
* [ ] URL Schemes: How will your app be identified from another application
1. Then, select Info.plist file.
1. Add the next code (select Open As>Source code):
     `<key>LSApplicationQueriesSchemes</key>
      <array>
          <string>deep-links-universal</string>
      </array>`

* The sheme is similar to YOU_URL_SCHEMES://PATH

### Handle Scheme Links
The code you need to handle the link (when it's called) is written in AppDelegate.swift file.

**Note:** *From Safari, enter the following url to check it: * [Custom Scheme Link](https://deep-links-universal.herokuapp.com/appios/product.html). It is important that the URL Scheme is `deep-links-universal` to try it.*
