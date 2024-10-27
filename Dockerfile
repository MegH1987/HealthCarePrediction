# Base Image -- PYHTON RUN TIME
# Ubuntu OS RUN TIME
FROM python:3.9-slim

#create working directory
WORKDIR /app

#copy all files into app
COPY . /app

#update existing packages
RUN apt-get update

#install the required packages -- xgboost
RUN apt-get install libgomp1 libomp-dev -y

#install the libraries from the requirements file recursively
RUN pip install -r requirements.txt

#make the port open outside container
EXPOSE 8501

#run the app
CMD ["streamlit", "run", "app.py","--server.port=8501", "--server.address=0.0.0.0"]