# Compatability, works only with Synapse X!
Compatability outside of Synapse X can be done by creating/declaring a function before the execution of UiApi called getgenv() that returns a table, ideally this function can store a table the doesn't change accross "reinjects" of UiApi so you can achieve a functionality that makes sure UiApi cannot be reinjected more than once, but that's up to you! Also make sure to set Protect to false so syn.protect_gui won't execute

# UiTemplate
UiTemplate is a template showing how the API can work...

# Using it
Usage really works with Synapse, but u can modify it to work with other injectors, feel free to use it in any project, you don't have to credit me but would be cool :)
Inject UiApi.lua before using any scripts that use this...
