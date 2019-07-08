from setuptools import setup, find_packages

setup(
    name='querysheild',
    version='0.1',
    packages=find_packages(include=["querysheild", "querysheild*"]),
    include_package_data=True,
    zip_safe=False,
    entry_points={
        'console_scripts': [
            'qs=querysheild.app:run'
        ]
    },
    install_requires=[
        'Flask==1.1.0',
        'SQLAlchemy',
        'Flask-Dance[sqla]'
    ],
    test_suite="tests",
)
