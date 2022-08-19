const { CucumberJSAllureFormatter } = require("allure-cucumberjs");
const { AllureRuntime } = require("allure-cucumberjs");

function Reporter(options) {
    return new CucumberJSAllureFormatter(
        options,
        new AllureRuntime({ resultsDir: "./allure-results" }),
        {
            labels: [
                {
                    pattern: [/@environment:(.*)/],
                    name: "category"
                },
                {
                    pattern: [/@severity:(.*)/],
                    name: "severity"
                }
            ]}
    );
}
Reporter.prototype = Object.create(CucumberJSAllureFormatter.prototype);
Reporter.prototype.constructor = Reporter;

exports.default = Reporter;