from setuptools import setup

setup(
    name='query-sheild',
    packages=['query-sheild'],
    include_package_data=True,
    install_requires=[
        'flask',
        'Flask-Dance[sqla]'
    ],
)