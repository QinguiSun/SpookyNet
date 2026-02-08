# SpookyNet Environment Setup Guide (Conda)

This guide describes how to set up a Conda environment for SpookyNet on Linux with GPU support.

## Prerequisites
- Linux OS
- Conda (Anaconda or Miniconda)
- NVIDIA GPU with appropriate drivers

## Installation Steps

### 1. Create a Conda Environment
Create a new environment with Python 3.10:
```bash
conda create -n spookynet python=3.10 -y
```

### 2. Activate the Environment
```bash
conda activate spookynet
```

### 3. Install PyTorch with GPU Support
For PyTorch 1.11.0 and CUDA 11.3 (compatible with most modern NVIDIA GPUs):
```bash
conda install pytorch==1.11.0 cudatoolkit=11.3 -c pytorch -y
```

### 4. Install Dependencies and SpookyNet
Install the package in editable mode, which will also install all required dependencies (`ase`, `numpy`, `scikit-learn`):
```bash
pip install -e .
```

## Verification

### 1. Check GPU Availability
Run the following command to verify that PyTorch can access the GPU:
```bash
python -c "import torch; print(f'GPU Available: {torch.cuda.is_available()}'); print(f'Device: {torch.cuda.get_device_name(0)}' if torch.cuda.is_available() else 'GPU not found')"
```

### 2. Run Example
Run the provided example script to ensure everything is working correctly:
```bash
python example.py
```

## Troubleshooting
- **Conda command not found**: Ensure conda is initialized in your shell (`conda init`).
- **CUDA errors**: Verify your NVIDIA drivers are correctly installed using `nvidia-smi`.
