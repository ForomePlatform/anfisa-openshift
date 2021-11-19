#!/bin/bash
for d in /anfisa/a-setup/{data,logs,vault,export/work,ui} ; do
    [ ! -d $d ] && mkdir -p $d
done
if [ ! -f /anfisa/a-setup/export/SEQaBOO_output_template_20190317.xlsx ]  ; then
  pushd /anfisa/a-setup/export
  curl -L -O https://www.dropbox.com/s/4dvunn3dusqc636/SEQaBOO_output_template_20190317.xlsx
  popd
fi

if [ ! -z ${ANFISA_COORD_HOST+z} ] && [ ! -z ${ANFISA_ROUTER_HOST+z} ] && [ ! -z ${ANFISA_MONGO_HOST+z} ] ;
then
    cat /anfisa/anfisa/setup/anfisa.json.docker | sed "s#anfisa-druid-coordinator:8081#${ANFISA_COORD_HOST}#g" | sed "s#router:8888#${ANFISA_ROUTER_HOST}#g" | sed "s#anfisa-mongodb#${ANFISA_MONGO_HOST}#g" -  > /anfisa/anfisa.json
fi

exec "$@"
