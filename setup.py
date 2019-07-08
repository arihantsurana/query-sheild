from setuptools import setup, find_packages

setup(
    name='query-sheild',
    packages=find_packages(include=["querysheild", "querysheild*"]),
    include_package_data=True,
    zip_safe=False,
    entry_points={
        'console_scripts': [
            'querysheild=querysheild.app:run'
        ]
    },
    install_requires=[
        'Flask',
        'SQLAlchemy',
        'Flask-Dance[sqla]'
    ],
    test_suite="tests",
)
