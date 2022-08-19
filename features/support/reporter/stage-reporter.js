const { CucumberJSAllureFormatter } = require("allure-cucumberjs");
const { AllureRuntime } = require("allure-cucumberjs");

function TestReporter(options) {
    return new CucumberJSAllureFormatter(
        options,
        new AllureRuntime({ resultsDir: "./allure-results-stage" }),
        {
            labels: [
                {
                    pattern: [/@category:(.*)/],
                    name: "category"
                },
                {
                    pattern: [/@message:(.*)/],
                    name: "message"
                }
            ]}
    );
}
TestReporter.prototype = Object.create(CucumberJSAllureFormatter.prototype);
TestReporter.prototype.constructor = TestReporter;

exports.default = TestReporter;