# SpookyNet Environment Setup Guide (Conda)

This guide describes how to set up a Conda environment for SpookyNet on Linux with GPU support.

## Prerequisites
- Linux OS
- Conda (Anaconda or Miniconda)
- NVIDIA GPU with appropriate drivers (e.g., Driver 580.x for TITAN RTX)

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
If you encounter an `ImportError: ... undefined symbol: iJIT_NotifyEvent` using `conda install`, it is recommended to use `pip` to install the official PyTorch wheel, which is more self-contained:

```bash
pip install torch==1.11.0+cu113 --extra-index-url https://download.pytorch.org/whl/cu113
```

*Note: For PyTorch 1.11.0, CUDA 11.3 is the recommended version for compatibility.*

### 4. Install Dependencies and SpookyNet
Install the package in editable mode from the repository root:
```bash
pip install -e .
```

## Verification

### 1. Check GPU Availability
Run the following command to verify that PyTorch can access the GPU:
```bash
python -c "import torch; print(f'PyTorch Version: {torch.__version__}'); print(f'GPU Available: {torch.cuda.is_available()}'); print(f'Device: {torch.cuda.get_device_name(0)}' if torch.cuda.is_available() else 'GPU not found')"
```

### 2. Run Example
Run the provided example script:
```bash
python example.py
```

## Troubleshooting
- **ImportError: ... undefined symbol: iJIT_NotifyEvent**: This is often caused by a conflict in the Conda PyTorch package. Using the `pip install` command mentioned above usually resolves this.
- **Conda command not found**: Ensure conda is initialized in your shell (`conda init`).
- **CUDA errors**: Verify your NVIDIA drivers are correctly installed using `nvidia-smi`.
