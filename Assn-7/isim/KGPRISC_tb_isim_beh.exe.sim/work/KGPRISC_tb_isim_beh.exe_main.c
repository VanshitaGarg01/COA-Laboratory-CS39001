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
    work_m_04329203469986666787_1351276808_init();
    work_m_07275095380913999386_3381898454_init();
    xilinxcorelib_ver_m_04284627112054182733_3123221743_init();
    xilinxcorelib_ver_m_04284627112054182733_0097192460_init();
    xilinxcorelib_ver_m_18166792875774041790_2843080771_init();
    xilinxcorelib_ver_m_17738287534884592592_1111589923_init();
    xilinxcorelib_ver_m_10066368518302646626_1008055727_init();
    work_m_13486228919492782400_0524322670_init();
    work_m_01440325637087849116_3945777025_init();
    work_m_07754583024390833616_1306279239_init();
    work_m_03603663952639803657_0278921292_init();
    work_m_13613078552133329751_2152786828_init();
    work_m_07578242916647320557_2227945711_init();
    work_m_00152401997380153182_4057675914_init();
    work_m_11721051116011954484_0597495051_init();
    work_m_12831953248678195109_2220136494_init();
    work_m_17121188353676179874_3246726298_init();
    work_m_14301112680459747475_1557921908_init();
    work_m_17803223957905475422_0886308060_init();
    work_m_01341892808434018575_1611753747_init();
    work_m_05450344764791039037_2370168646_init();
    work_m_08060556364566216643_1310296684_init();
    xilinxcorelib_ver_m_17738287534884592592_3892810829_init();
    xilinxcorelib_ver_m_10066368518302646626_0851019369_init();
    work_m_10431123694831851113_1278436645_init();
    work_m_07754583024390833616_2232003288_init();
    work_m_03759645634690135232_3027548060_init();
    work_m_00887554340442554794_3387524553_init();
    work_m_13931852578857541422_2074985839_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_13931852578857541422_2074985839");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
