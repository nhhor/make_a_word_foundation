# Application: **Make a Word Foundation**

##### By Noah Horwitz

###### _First published 2019-12-20_

## Description:
This application was made as part of a coding project for Noah Horwitz, a student at _[Epicodus](http://www.epicodus.com)_, a vocational school for technology careers based in Portland, OR. The project is designed to create an application that contains a Word class. The homepage of the app should list all words. When a word is clicked, it should lead to a page with the word's definitions. users should be able to add a word, and when viewing a word, be able to add, update or delete one or more definitions..


## Setup/Installation instructions:
* Click the `Clone or download` button and copy the link.
* Open your terminal application (assuming **GIT Scripts** and **node.js** (with NPM), and **Ruby 2.5.1** have been installed on your system) and type `git clone (link)`.
* In the terminal using the `cd`... command, navigate to the newly created repository and run `bundle install`.
* Then in the terminal, run `app.rb`.


## Technologies Used
> `Ruby`
> `Ruby gem Sinatra`

## Known Bugs
* None

## Behavior Driven Development Specifications

|Spec|Input|Output|
|-|-|-|
|User should be able to add new words to the app and it will display all words entered.|input add: `Test 3a`,`Test 3b`|Test 3a, Test 3b|
|User should be able to update existing word(s)|click_on `Word4a`, click_on `Edit word` fill_in `new word name`, click_on `Update` | "Word4a" => "new word name"|
|User should be able to click on a created word and add in the resulting view be able to add a new definition|click_on `Word5a`, fill_in `Definition5a`, click_on `Add definition` |Word Name: Word5a, Word Definitions: Definition5a|






## References

## Support and contact details
Contact [example@sample.com](mailto:example@sample.com)

## License
_This This repository is copyright (C) 2019 by Noah Horwitz and licensed under the GNU General Public License v3.0 [gpl-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)_.
