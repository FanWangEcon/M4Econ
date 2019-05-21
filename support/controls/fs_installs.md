Setting Up Jupyter Notebook with matlab

https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html

1. Install Matlab
    + https://www.mathworks.com/login
2. Check Python Installation (install via Continuum)
    + open up Anaconda Prompt (with admin rights)
    + type in: "python --version"
3. Where matlab is stored: C:/Program Files/MATLAB/R2019a
    + Find by typing inside matlab: matlabroot
4. In Anaconda Prompt:
    + type in: cd "C:/Program Files/MATLAB/R2019a/extern/engines/python"
    + type in: python setup.py install
    + type in: pip install matlab_kernel
    + conda install -c conda-forge r-matlab
