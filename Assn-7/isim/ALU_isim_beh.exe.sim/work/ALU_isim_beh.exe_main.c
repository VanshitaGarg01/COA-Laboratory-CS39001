/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_07578242916647320557_2227945711_init();
    work_m_00152401997380153182_4057675914_init();
    work_m_11721051116011954484_0597495051_init();
    work_m_12831953248678195109_2220136494_init();
    work_m_17121188353676179874_3246726298_init();
    work_m_14301112680459747475_1557921908_init();
    work_m_17803223957905475422_0886308060_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_17803223957905475422_0886308060");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
