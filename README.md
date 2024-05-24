# LLM Containerized Application

This project provides a Dockerized setup for running a Large Language Model (LLM) using Flask as an API service. The LLM is implemented using the Hugging Face Transformers library and served via a REST API.

## Introduction

This repository contains the necessary files and instructions to build and run a Docker container for serving a large language model (LLM) as an API. The model is based on the GPT-2 architecture from Hugging Face's Transformers library.

## Features

- **Containerized Application**: Ensures consistency across different environments.
- **Flask API**: Exposes a simple REST API for generating text.
- **Pretrained Model**: Utilizes a pretrained GPT-2 model for text generation.
- **Customizable**: Easily switch to different models from the Hugging Face model hub.

## Installation

### Prerequisites

- Docker installed on your machine.
- Internet connection to download the Docker image and model.

### Steps

1. Clone the repository:
    ```sh
    git clone hhttps://github.com/qandeelfatima11/LLM_Containers
    cd LLM_Containers
    ```

2. Build the Docker image:
    ```sh
    docker build -t my-llm-app .
    ```

3. Run the Docker container:
    ```sh
    docker run -d -p 5000:5000 my-llm-app
    ```

## Usage

### Interacting with the API

Once the container is running, you can interact with the LLM API using `curl` or any HTTP client.

#### Generate Text

```sh
curl -X POST http://localhost:5000/generate -H "Content-Type: application/json" -d '{"prompt":"Hello, what is docker?"}'
