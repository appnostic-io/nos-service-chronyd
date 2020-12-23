#!/bin/sh -e

if [ "${DEBUG}" == "true" ]; then
  set -x
fi


CHRONY_CONF="/etc/chrony/chrony.conf"

echo "# nos chronyd config" > ${CHRONY_CONF}

# Individual NTP Servers
if [ -n "${NTP_SERVERS}" ]; then
  OIFS=$IFS
  IFS=" "
  
  for server in ${NTP_SERVERS} ; do
    echo "server $server iburst minpoll 14 maxpoll 14" >> ${CHRONY_CONF}
  done;
else
    echo "server pool.ntp.org iburst minpoll 14 maxpoll 14" >> ${CHRONY_CONF}	
fi

# Other more static options
cat <<_EOF >> ${CHRONY_CONF}
driftfile /var/lib/chrony/chrony.drift
maxupdateskew 100
makestep 1 -1
logchange 1
maxdistance 16
hwtimestamp *
_EOF

cat ${CHRONY_CONF}

  exec chronyd "-d" "-f" "${CHRONY_CONF}" 
