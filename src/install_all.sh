#!/bin/sh
set -xeu

build_dir=`pwd`

CP='cp -rp'

# Check final exec folder exists
if [ ! -d "../exec" ]; then
  echo "Creating ../exec folder"
  mkdir ../exec
fi

#------------------------------------
# INCLUDE PARTIAL BUILD 
#------------------------------------

. ./partial_build.sh

#------------------------------------
# install forecast
#------------------------------------
#${CP} NEMSfv3gfs/fv3.exe                               ../exec/regional_forecast.x

#------------------------------------
# install post
#------------------------------------
$Build_post && {
 ${CP} EMC_post/exec/*                                 ../exec/ncep_post
}

#------------------------------------
# install needed utilities from UFS_UTILS.
#------------------------------------
$Build_UFS_UTILS && {
# ${CP} regional_utils.fd/exec/global_chgres            ../exec/regional_chgres.x
 ${CP} UFS_UTILS/exec/chgres_cube                      ../exec/chgres_cube.exe
 ${CP} UFS_UTILS/exec/orog                             ../exec/orog.x
 ${CP} UFS_UTILS/exec/sfc_climo_gen                    ../exec/sfc_climo_gen
 ${CP} UFS_UTILS/exec/regional_esg_grid                ../exec/regional_esg_grid
 ${CP} UFS_UTILS/exec/make_hgrid                       ../exec/make_hgrid
 ${CP} UFS_UTILS/exec/make_solo_mosaic                 ../exec/make_solo_mosaic
 ${CP} UFS_UTILS/exec/fregrid                          ../exec/fregrid
 ${CP} UFS_UTILS/exec/filter_topo                      ../exec/filter_topo
 ${CP} UFS_UTILS/exec/shave                            ../exec/shave.x
 ${CP} UFS_UTILS/exec/global_equiv_resol               ../exec/global_equiv_resol
}

#------------------------------------
# install gsi
#------------------------------------
$Build_gsi && {
 ${CP} regional_gsi.fd/exec/global_gsi.x               ../exec/regional_gsi.x
 ${CP} regional_gsi.fd/exec/global_enkf.x              ../exec/regional_enkf.x
 ${CP} regional_gsi.fd/exec/adderrspec.x               ../exec/regional_adderrspec.x
 ${CP} regional_gsi.fd/exec/adjustps.x                 ../exec/regional_adjustps.x
 ${CP} regional_gsi.fd/exec/calc_increment_ens.x       ../exec/regional_calc_increment_ens.x
 ${CP} regional_gsi.fd/exec/calc_increment_serial.x    ../exec/regional_calc_increment_serial.x
 ${CP} regional_gsi.fd/exec/getnstensmeanp.x           ../exec/regional_getnstensmeanp.x
 ${CP} regional_gsi.fd/exec/getsfcensmeanp.x           ../exec/regional_getsfcensmeanp.x
 ${CP} regional_gsi.fd/exec/getsfcnstensupdp.x         ../exec/regional_getsfcnstensupdp.x
 ${CP} regional_gsi.fd/exec/getsigensmeanp_smooth.x    ../exec/regional_getsigensmeanp_smooth.x
 ${CP} regional_gsi.fd/exec/getsigensstatp.x           ../exec/regional_getsigensstatp.x
 ${CP} regional_gsi.fd/exec/gribmean.x                 ../exec/regional_gribmean.x
 ${CP} regional_gsi.fd/exec/nc_diag_cat.x              ../exec/regional_nc_diag_cat.x
 ${CP} regional_gsi.fd/exec/nc_diag_cat_serial.x       ../exec/regional_nc_diag_cat_serial.x
 ${CP} regional_gsi.fd/exec/oznmon_horiz.x             ../exec/regional_oznmon_horiz.x
 ${CP} regional_gsi.fd/exec/oznmon_time.x              ../exec/regional_oznmon_time.x
 ${CP} regional_gsi.fd/exec/radmon_angle.x             ../exec/regional_radmon_angle.x
 ${CP} regional_gsi.fd/exec/radmon_bcoef.x             ../exec/regional_radmon_bcoef.x
 ${CP} regional_gsi.fd/exec/radmon_bcor.x              ../exec/regional_radmon_bcor.x
 ${CP} regional_gsi.fd/exec/radmon_time.x              ../exec/regional_radmon_time.x
 ${CP} regional_gsi.fd/exec/recenternemsiop_hybgain.x  ../exec/regional_recenternemsiop_hybgain.x
 ${CP} regional_gsi.fd/exec/recentersigp.x             ../exec/regional_recentersigp.x
 ${CP} regional_gsi.fd/exec/test_nc_unlimdims.x        ../exec/regional_test_nc_unlimdims.x
}

echo;echo " .... Install system finished .... "

exit 0
