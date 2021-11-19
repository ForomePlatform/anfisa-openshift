# Example Anfisa Docker container for OpenShift.

In this example we deploy Anfisa and Anfisa Annotator OpenShift environment.

Optional components (if this services already deployed):

Apache Druid

MongoDB

PostgreSQL

MySQL

## How to deploy Anfisa to OpenShift via HELM 3

1. Login to your OpenShift Cluster

2. Go to your project

`oc project PROJECT_NAME`

4. Clone this repo

`git clone https://github.com/ForomePlatform/anfisa-openshift.git`

5. Go to directory with helm chart

`cd anfisa-chart/`

7.  Start deploy

`helm install anfisa -n "PROJECT_NAME" --debug  .`

8. Go to OpenShift platform console and start building (in this step image will be built and pushed to internal container registry)

Tab "BUILDS" -> subtab "buildConfigs" -> options -> "start build"

## How to use

### Add dataset WS

1. Put your dataset to POD_NAME:/anfisa/a-setup/data/DATASET_NAME

2. Enter command:

`oc exec -it POD_NAME -- bash -c 'PYTHONPATH=/anfisa/anfisa/ python3 -m app.storage -c /anfisa/anfisa.json -m create -f -k ws -i /anfisa/a-setup/data/DATASET_NAME/inventory_file.cfg DATASET_VISIBLE_NAME'`

3. If not inventory file:

`oc exec -it POD_NAME -- bash -c 'PYTHONPATH=/anfisa/anfisa/ python3 -m app.storage -c /anfisa/anfisa.json -m create -f -k ws -s /anfisa/a-setup/data/DATASET_NAME/source_file.json.gz DATASET_VISIBLE_NAME'`

### Add dataset XL

1. Put your dataset to POD_NAME:/anfisa/a-setup/data/DATASET_NAME

2. Enter command:

`oc exec -it POD_NAME -- bash -c PYTHONPATH=/anfisa/anfisa/ python3 -m app.storage -c /anfisa/anfisa.json -m create -f -k xl -i /anfisa/a-setup/data/DATASET_NAME/inventory_file.cfg XL_DATASET_VISIBLE_NAME'`
