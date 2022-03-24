/**
 * This is the parent model file that all your models should extend.
 * You can add functions to this file to make them available in all your models.
 * Do not delete this file.
 */
component extends="wheels.Model" {

    public any function $createInstance(
        required struct properties,
        required boolean persisted,
        numeric row = 1,
        boolean base = true,
        boolean callbacks = true
    ) {
        modelObject = super.$createInstance(argumentCollection=arguments)
        return modelObject
    }
}
