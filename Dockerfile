# Use an official PyTorch image as a parent image
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in setup.py
RUN pip install .

# Set the default command to execute when the container starts
CMD ["bash"]
