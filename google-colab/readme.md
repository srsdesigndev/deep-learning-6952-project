# Google Colab — Complete Information

---

## What Is Google Colab?

Google Colaboratory (Colab) is a **free, cloud-based notebook environment** built by Google. It lets you write and run Python (and other) code directly in your browser — no installation, no setup, no local hardware required.

Think of it as:
- A **Jupyter Notebook** that lives in the cloud
- With **free access to GPUs and TPUs**
- Connected to **Google Drive**
- Shareable like a **Google Doc**

It's used by students, researchers, data scientists, and ML engineers worldwide for everything from learning Python to training large AI models.

---

## Who Uses It and Why

| User | Why they use Colab |
|------|--------------------|
| Students | Free environment, nothing to install, runs anywhere |
| Data Scientists | Easy data exploration, pre-installed libraries |
| ML Engineers | Free GPU access, fast experimentation |
| Researchers | Reproducible notebooks, easy sharing |
| Hobbyists | Run AI models without expensive hardware |

---

## The Basic Interface

When you open a Colab notebook, you're looking at a **`.ipynb` file** (IPython Notebook) rendered in the browser.

```
┌────────────────────────────────────────────────┐
│  File  Edit  View  Insert  Runtime  Tools  Help │  ← Menu bar
├────────────────────────────────────────────────┤
│  [+ Code]  [+ Text]          RAM ██░░  Disk ░░ │  ← Toolbar
├──────┬─────────────────────────────────────────┤
│      │                                         │
│ File │   [ Cell 1: Code ]                      │
│ Pane │   ▶  import pandas as pd                │
│      │                                         │
│      │   [ Cell 2: Text ]                      │
│      │   ## My Analysis                        │
│      │                                         │
└──────┴─────────────────────────────────────────┘
```

### The Two Panels

**Left sidebar** contains:
- 📁 **Files** — browse your runtime's filesystem and Google Drive
- 🔍 **Search** — search across all cells
- ⌚ **History** — command history
- 🔌 **Secrets** — store API keys safely (environment variables)
- `{}` **Variables** — inspect variables currently in memory

**Main area** — your notebook cells, stacked vertically

---

## Cells — The Core Building Block

Everything in Colab lives inside **cells**. There are two types:

### Code Cells
Contain executable code. Click the ▶ button or press `Shift + Enter` to run.

```python
# This is a code cell
x = 10
y = 20
print(x + y)  # Output appears below the cell
```

Output appears directly underneath the cell, inline.

### Text Cells (Markdown)
Contain formatted text written in **Markdown** — used for notes, explanations, headers, and documentation.

```markdown
## This is a heading
This is **bold** and this is *italic*.
- Bullet point
```

Renders as styled text when not in edit mode. Double-click any text cell to edit it.

---

## Running Code

| Action | Shortcut |
|--------|----------|
| Run current cell | `Shift + Enter` |
| Run cell, don't move | `Ctrl + Enter` |
| Run all cells | `Runtime → Run all` |
| Run before current cell | `Runtime → Run before` |
| Interrupt execution | `Runtime → Interrupt` |
| Restart runtime | `Runtime → Restart runtime` |

> **Important:** Cells share a single Python session. A variable defined in Cell 1 is accessible in Cell 5. But if you restart the runtime, all variables are lost and you must re-run cells from the top.

---

## Runtime Types — Choosing Your Engine

Go to **Runtime → Change runtime type** to configure your compute.

### Programming Language

| Option | Use case |
|--------|----------|
| **Python 3** | Default. Used for everything — ML, data science, scripting |
| **R** | Statistical computing, bioinformatics, research |
| **Julia** | High-performance scientific computing, numerical analysis |

Python 3 is the right choice for 99% of use cases.

---

### Hardware Accelerator

The accelerator is the processor that runs your computations. This is the most important runtime setting.

#### CPU — Central Processing Unit
- Default option
- Best for: learning, general Python, pandas, web scraping, light data work
- Avoid for: training neural networks (will be very slow)
- Free, always available

#### T4 GPU
- Entry-level GPU, available on free tier (with limits)
- ~16 GB VRAM
- Best for: beginner ML projects, small model training, image classification
- ~10x faster than CPU for matrix operations

#### L4 GPU
- Mid-range modern GPU (NVIDIA Ada Lovelace)
- ~24 GB VRAM
- Best for: larger models, faster inference, video tasks, medium LLMs
- Requires Colab Pro

#### G4 GPU
- Newer generation, sits between L4 and A100
- Efficient for inference-heavy workloads

#### A100 GPU
- **Most powerful standard GPU on Colab**
- 40–80 GB VRAM
- Used by professional ML researchers and AI companies
- 3–10x faster than T4 for deep learning
- Best for: large model training, diffusion models, serious research
- Requires Colab Pro+

#### H100 GPU
- NVIDIA's latest data center GPU (Hopper architecture)
- Fastest available — purpose-built for transformer/LLM workloads
- Up to 2x faster than A100 for AI tasks
- Best for: frontier-level model work
- Requires Colab Pro+

#### v6e-1 TPU
- Google's custom chip, built from the ground up for ML
- Extremely fast for JAX and TensorFlow workloads
- Not plug-and-play — your code must be written to target TPU
- Best for: large-scale training with JAX/TensorFlow

#### v5e-1 TPU
- Previous-generation TPU, still very capable
- Same constraints as v6e-1

**GPU vs TPU rule of thumb:**
- Writing PyTorch? → Use a GPU
- Writing JAX or TensorFlow and know what you're doing? → Consider a TPU

---

### High-RAM

A toggle that roughly 4x's your system RAM (the regular memory, not GPU VRAM).

| Setting | Approx. RAM |
|---------|-------------|
| Standard | ~12 GB |
| High-RAM | ~52 GB |

Enable when: loading large datasets, working with massive DataFrames, or getting "out of memory" errors unrelated to your GPU.

---

### Runtime Version

Colab snapshots its software environment periodically. Versions are named by date (e.g., `2026.01`, `2025.10`, `2025.07`).

| Option | When to use |
|--------|-------------|
| **Latest (recommended)** | Always — gives newest libraries and drivers |
| `2026.01` | Reproducibility — pin a specific environment |
| `2025.10` | If "latest" broke something you need |
| `2025.07` | Older compatibility requirements |

Pinning an older version is only useful if you need an exact environment to reproduce old results.

---

## The File System

Your Colab runtime has its own **temporary Linux filesystem** at `/content/`. It's a real Ubuntu machine.

```
/content/
├── sample_data/       ← Pre-loaded example datasets
│   ├── mnist_train.csv
│   ├── california_housing_train.csv
│   └── ...
└── (your uploaded files go here)
```

**Critical:** This filesystem is **wiped when the runtime disconnects**. Nothing is saved automatically. To persist files, you must:
1. Save to Google Drive
2. Download files before disconnecting
3. Use an external storage service (S3, GCS, etc.)

---

## Google Drive Integration

Mount your Drive to access your files directly from Colab:

```python
from google.colab import drive
drive.mount('/content/drive')
```

After authenticating, your Drive appears at `/content/drive/MyDrive/`.

```python
# Read a file from Drive
import pandas as pd
df = pd.read_csv('/content/drive/MyDrive/data/my_dataset.csv')

# Save a file to Drive
df.to_csv('/content/drive/MyDrive/results/output.csv', index=False)
```

Drive files **persist between sessions** — this is your primary way to save work.

---

## Uploading and Downloading Files

### Upload a file from your computer

```python
from google.colab import files
uploaded = files.upload()
# A file picker dialog opens in the browser
```

### Download a file to your computer

```python
from google.colab import files
files.download('my_output.csv')
```

### Upload via the Files panel

Click the 📁 icon in the left sidebar → click the upload icon → drag & drop files. They land in `/content/`.

---

## The Terminal — Running Shell Commands

You can run **Linux shell commands** directly inside code cells by prefixing with `!`:

```python
# Install a package
!pip install transformers

# List files
!ls /content/

# Check disk space
!df -h

# Download a file from the internet
!wget https://example.com/dataset.zip

# Unzip a file
!unzip dataset.zip

# Clone a GitHub repo
!git clone https://github.com/user/repo.git

# Check GPU info
!nvidia-smi

# Check CPU info
!cat /proc/cpuinfo | grep "model name" | head -1

# Check RAM
!free -h

# Install system packages
!apt-get install -y ffmpeg
```

For multi-line shell interaction, use `%%bash` at the top of a cell:

```bash
%%bash
cd /content
mkdir my_project
cd my_project
echo "Project ready" > README.txt
cat README.txt
```

### Opening a Real Terminal

Go to **Tools → Terminal** to open a full interactive terminal session in a sidebar panel. You get a real bash shell — you can `cd`, `vim`, run scripts, check processes, everything.

---

## Magic Commands

Colab inherits Jupyter's **magic commands** — special shortcuts that start with `%` or `%%`:

```python
# Time how long a single line takes
%time result = sum(range(1_000_000))

# Time an entire cell
%%time
import numpy as np
arr = np.random.rand(10000, 10000)
result = arr @ arr.T

# See all variables in memory
%whos

# Run a Python script file
%run my_script.py

# Load code from a file into a cell
%load my_script.py

# Auto-reload modules when they change (useful for development)
%load_ext autoreload
%autoreload 2

# Show matplotlib plots inline (usually default)
%matplotlib inline

# Interactive plots
%matplotlib widget
```

---

## Pre-installed Libraries

Colab comes with most major data science and ML libraries already installed:

| Category | Libraries |
|----------|-----------|
| Data | pandas, numpy, scipy |
| Visualization | matplotlib, seaborn, plotly |
| ML / Classical | scikit-learn, xgboost, lightgbm |
| Deep Learning | TensorFlow, PyTorch, Keras, JAX |
| NLP | NLTK, spaCy |
| Computer Vision | OpenCV, Pillow |
| Other | requests, beautifulsoup4, sympy |

Install anything not listed with `!pip install packagename`.

---

## Secrets — Storing API Keys Safely

Never hardcode API keys in your notebook. Use the **Secrets panel** instead.

1. Click the 🔑 icon in the left sidebar
2. Click **+ Add new secret**
3. Enter a name (e.g., `OPENAI_API_KEY`) and your key value
4. Toggle "Notebook access" on

Access it in code:

```python
from google.colab import userdata
api_key = userdata.get('OPENAI_API_KEY')
```

Secrets are tied to your Google account and never exposed in the notebook file.

---

## Forms — Building Simple UI Controls

Colab supports **form widgets** — UI controls created with special comments:

```python
# @title My Settings Form
name = "Alice"  # @param {type:"string"}
age = 25  # @param {type:"integer"}
model = "gpt-4"  # @param ["gpt-3.5", "gpt-4", "claude"] {type:"string"}
use_gpu = True  # @param {type:"boolean"}
threshold = 0.5  # @param {type:"slider", min:0, max:1, step:0.1}
```

This renders as an interactive form panel above the cell — useful for building demo notebooks where non-coders can adjust parameters without editing code.

---

## Displaying Rich Output

```python
# Display images
from IPython.display import Image, display
display(Image('/content/photo.jpg'))

# Display HTML
from IPython.display import HTML
display(HTML('<h2 style="color:blue">Hello!</h2>'))

# Display video
from IPython.display import Video
display(Video('/content/video.mp4'))

# Display a DataFrame as a nice table (automatic in Colab)
import pandas as pd
df = pd.DataFrame({'A': [1,2,3], 'B': [4,5,6]})
df  # Just type the variable name on the last line

# Interactive DataFrames
from google.colab import data_table
data_table.enable_dataframe_formatter()
```

---

## GPU — How to Actually Use It

Selecting a GPU in the runtime settings gives you hardware access. You need to tell your code to use it:

### PyTorch

```python
import torch

# Check if GPU is available
print(torch.cuda.is_available())  # True if GPU runtime is selected
print(torch.cuda.get_device_name(0))  # e.g., "Tesla T4"

# Move data to GPU
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
tensor = torch.randn(1000, 1000).to(device)
model = MyModel().to(device)
```

### TensorFlow

```python
import tensorflow as tf

# List available GPUs
print(tf.config.list_physical_devices('GPU'))

# TensorFlow uses GPU automatically if available
```

### Check GPU memory

```python
!nvidia-smi
```

---

## Colab Pro vs Free — What's the Difference

| Feature | Free | Pro | Pro+ |
|---------|------|-----|------|
| GPU access | T4 (limited) | T4, L4, A100 | All incl. H100 |
| Session length | ~12 hours | ~24 hours | ~24 hours |
| RAM | ~12 GB | ~32 GB | ~52 GB (High-RAM) |
| Background execution | ❌ | ❌ | ✅ |
| Idle timeout | Shorter | Longer | Longest |
| Compute units | Limited | Monthly allocation | More allocation |
| Priority access | Low | Higher | Highest |

Free tier is genuinely useful but:
- Sessions disconnect after ~90 minutes of browser inactivity
- GPU access is not guaranteed and can be revoked
- You'll hit RAM limits on large datasets

---

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Run cell | `Shift + Enter` |
| Run, stay on cell | `Ctrl + Enter` |
| Add code cell below | `Ctrl + M, B` |
| Add code cell above | `Ctrl + M, A` |
| Delete cell | `Ctrl + M, D` |
| Convert to text cell | `Ctrl + M, M` |
| Convert to code cell | `Ctrl + M, Y` |
| Move cell up | `Ctrl + M, K` |
| Move cell down | `Ctrl + M, J` |
| Find and replace | `Ctrl + H` |
| Command palette | `Ctrl + Shift + P` |
| Comment/uncomment | `Ctrl + /` |
| Interrupt runtime | `Ctrl + M, I` |
| Restart runtime | `Ctrl + M, .` |

---

## Sharing Notebooks

Colab notebooks are stored in **Google Drive** and shared exactly like Google Docs:

1. Click **Share** (top right)
2. Set permissions: Viewer / Commenter / Editor
3. Share the link or invite by email

**Publishing:** File → Save a copy to GitHub to publish notebooks publicly. Notebooks on GitHub render on [nbviewer.org](https://nbviewer.org) or run directly via a Colab badge.

Add an "Open in Colab" button to any notebook on GitHub:
```markdown
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/USERNAME/REPO/blob/main/notebook.ipynb)
```

---

## Advanced: Running Colab Headlessly

You can trigger Colab notebooks to run programmatically via the **Colab API** or use **Colab Enterprise** (Google Cloud) for scheduled/automated runs.

For local use, you can also point a Colab notebook at a **local runtime** (your own machine):
- Runtime → Connect to a local runtime
- Requires `jupyter_http_over_ws` installed locally
- Useful when you need your local files/GPU but want the Colab UI

---

## Common Workflows

### Data Analysis
```python
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('/content/drive/MyDrive/data.csv')

# Explore
df.head()
df.describe()
df.info()

# Visualize
df['column'].hist()
plt.show()
```

### Train a Neural Network
```python
# 1. Select GPU runtime first (Runtime → Change runtime type → T4/A100)
# 2. Install libraries if needed
!pip install torch torchvision

# 3. Write and train your model
import torch
import torch.nn as nn

model = nn.Sequential(nn.Linear(784, 128), nn.ReLU(), nn.Linear(128, 10))
model = model.cuda()  # Move to GPU
# ... training loop ...

# 4. Save model to Drive
torch.save(model.state_dict(), '/content/drive/MyDrive/model.pth')
```

### Run a Hugging Face Model
```python
!pip install transformers

from transformers import pipeline

# This downloads and runs entirely in the cloud
classifier = pipeline("sentiment-analysis")
result = classifier("Google Colab is amazing!")
print(result)  # [{'label': 'POSITIVE', 'score': 0.999}]
```

---

## Limitations to Know

- **Runtime disconnects** — if idle too long, you lose all in-memory data (not Drive files)
- **No persistent background jobs** on free/Pro (Pro+ supports it)
- **Disk space** — ~100 GB on the runtime, lost on disconnect
- **Internet access** — available, but some ports/domains may be restricted
- **Not for production** — Colab is for experimentation and learning, not serving live applications
- **GPU not guaranteed** — on free tier, Google can reclaim it if demand is high

---

## Tips and Best Practices

1. **Always save to Drive** — never rely on the runtime filesystem for important files
2. **Pin library versions** for reproducible notebooks: `!pip install pandas==2.1.0`
3. **Use Secrets** for API keys — never paste them in cells
4. **Restart and Run All** before sharing — ensures the notebook runs clean top to bottom
5. **Add text cells** to explain your code — makes notebooks self-documenting
6. **Use `%%time`** to benchmark slow cells before optimizing
7. **Check GPU memory with `!nvidia-smi`** before loading large models
8. **Mount Drive first** in any notebook that reads/writes files
9. **Use forms** to make demo notebooks accessible to non-programmers
10. **Close unused runtimes** to free up your compute quota

---

*Google Colab | Complete Reference Guide*
*Covers: UI, Runtimes, Terminal, GPU, Drive, Sharing, Shortcuts, and Workflows*