# Salesforce Project - Pipeline

This Salesforce project contains a flexible, efficient solution for creating customizable pipelines for processing workflows or sequences of operations in Apex language.

## Structure

This project comprises several components, each serving a particular role:

1. `Pipeline`: The backbone of the system. It manages the pipeline's execution, allows adding filters, and provides necessary checks to ensure the validity of the operations. It includes a custom exception class, `PipelineException`, which throws errors specific to the pipeline processing.

2. `Starter`: As the name implies, this class initiates the pipeline processing. It creates the pipeline instance by using the `PipelineFactory` and kicks off the processing. It also includes a custom exception class, `StarterException`, designed to handle any exceptions occurring during the pipeline initiation.

3. `PipelineFactory`: A factory class responsible for generating `Pipeline` instances based on input parameters. It also constructs `MessageStruct` instances, which are used for data transportation during the pipeline execution. The class includes a custom exception `AWException` for error handling during pipeline creation.

4. `MessageStruct`: A simple class designed to hold the data (message and change list) being processed through the pipeline.

5. `FilterInterface`: An interface defining the methods that all filters added to the pipeline must implement.

6. `FilterAbstract`: This is an abstract class that provides a base implementation of the `FilterInterface`. It contains methods for setup, processing, proceeding with the pipeline execution, and managing the next filter in the pipeline.

## Getting Started

To get started with this project, clone the repository and import the classes into your Salesforce org. Use the `Starter` class to initiate the pipeline processing. Make sure that the classes are in the correct directories and that the Apex code is compiled without errors.

## Usage

Create the instance of the `Pipeline` class using `PipelineFactory.createPipeline(pipelineObj)`. Add the desired filters to the pipeline using `addFilter(filter)` method and start the pipeline using `PipelineInts.process()` method.

## Contributing

We appreciate all contributions. To contribute, please open an issue first to discuss your ideas or directly make a pull request.

## Testing

Ensure all components function as expected by writing comprehensive unit tests in Salesforce. Aim for at least 75% code coverage as per Salesforce's guidelines.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
