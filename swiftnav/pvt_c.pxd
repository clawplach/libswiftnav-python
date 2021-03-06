# Copyright (C) 2012 Swift Navigation Inc.
#
# This source is subject to the license found in the file 'LICENSE' which must
# be be distributed together with this source. All other rights reserved.
#
# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.

from common cimport *
from track_c cimport navigation_measurement_t
from gpstime_c cimport gps_time_t

cdef extern from "libswiftnav/pvt.h":
  ctypedef struct dops_t:
    double pdop
    double gdop
    double tdop
    double hdop
    double vdop

  ctypedef struct gnss_solution:
    double pos_llh[3]
    double pos_ecef[3]
    double pos_ned[3]
    double vel_ecef[3]
    double vel_ned[3]
    double err_cov[7]
    gps_time_t time
    u8 gps_solution_valid
    u8 n_used

  u8 calc_PVT(u8 n_used,
              navigation_measurement_t nav_meas[],
              gnss_solution *soln,
              dops_t *dops)

