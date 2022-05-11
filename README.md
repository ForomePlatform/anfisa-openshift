# Anfisa

<!-- toc -->

- [Overview](#overview)
- [Online Development Documentation](#online-development-documentation)
- [Installation](#installation)
  * [Select branch or release:](#select-branch-or-release)
  * [Installation instructions](#installation-instructions)


<!-- tocstop -->

## Overview

Anfisa is a Variant Analysis and Curation Tool. Its purpose is to 
bring together Genetic Research and Clinical settings and provide a 
medical genticist with access to research Genome.

See more about the goal of the project at https://forome.org/  

A detailed [Setup and Administration Guide](https://github.com/ForomePlatform/anfisa/blob/master/Anfisa%20v.0.5%20Setup%20%26%20Administration%20Reference.pdf) is included with the distribution. 

## Online Development Documentation

- Installation & Administration Documentation

https://foromeplatform.github.io/documentation/anfisa-dev.v0.6/

- User Documentation

https://foromeplatform.github.io/documentation/anfisa-user.v0.6/

##  Installation

### Select branch or release:
This is a master branch that from time to time can be unstable or untested.
If you would like to try Anfisa, we strongly recommend installing it from one 
of the released tags 


### Installation instructions

How to deploy Anfisa to OpenShift via HELM
Login to your OpenShift Cluster

Go to your project
oc project PROJECT_NAME

git clone https://github.com/ForomePlatform/anfisa-openshift.git 

cd anfisa-openshift/anfisa-chart

Edit values.yml and set your project

Assign the anyuid security context constraint to the project:  
oc adm policy add-scc-to-user anyuid system:serviceaccount:<project name>:default

Grant all authenticated users access to the anyuid SCC:
oc adm policy add-scc-to-group anyuid system:authenticated

Add the IBM Cloud Helm repository ibm-helm to your cluster.

helm repo add ibm-helm https://raw.githubusercontent.com/IBM/charts/master/repo/ibm-helm

Update the Helm repo to retrieve the latest version of all Helm charts in this repo.

helm repo update

Download the Helm chart and unpack the chart in your current directory. Then, navigate to the ibm-object-storage-plugin directory.

helm fetch --untar ibm-helm/ibm-object-storage-plugin && cd ibm-object-storage-plugin

Install the ibmc Helm plug-in.
helm plugin install ./helm-ibmc

Verify that the ibmc plug-in is installed successfully.

helm ibmc --help

Install the IBM Cloud Object Storage plug-in. When you install the plug-in, pre-defined storage classes are added to your cluster.
helm ibmc install ibm-object-storage-plugin ibm-helm/ibm-object-storage-plugin --set license=true

Verify that the storage classes are created successfully. Note that this output varies depending on the type of cluster you use.
oc get storageclass | grep 'ibmc-s3fs'

Install anfisa via Helm
helm upgrade --install anfisa -n PROJECT_NAME --debug .

In openshift console start all builds.


click BUILD -> buildconfigs -> start build
Pods will be start
