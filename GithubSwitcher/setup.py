from setuptools import setup, find_packages

setup(
    name="github_switcher",
    version="0.1",
    packages=find_packages(),
    entry_points={
        "console_scripts": [
            "github-switcher=github_switcher.switcher:main",
        ],
    },
)
