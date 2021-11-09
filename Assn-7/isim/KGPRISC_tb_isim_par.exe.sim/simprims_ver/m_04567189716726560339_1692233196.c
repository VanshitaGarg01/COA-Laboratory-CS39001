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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif



static void NetDecl_36_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 3200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 5440);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 3864);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 3768);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Gate_38_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1888U);
    t3 = *((char **)t2);
    t2 = (t0 + 2048U);
    t4 = *((char **)t2);
    t2 = (t0 + 3928);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    xsi_vlog_bufIf0Gate(t8, t3, t4);
    t9 = (t0 + 3928);
    xsi_driver_vfirst_trans_bufif(t9, 0, 0);
    t10 = (t0 + 3784);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void simprims_ver_m_04567189716726560339_1692233196_3605918078_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3605918078", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3605918078.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1037716093_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1037716093", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1037716093.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2105838221_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2105838221", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2105838221.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0959420992_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0959420992", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0959420992.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3524796739_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3524796739", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3524796739.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2289697085_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2289697085", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2289697085.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3741733124_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3741733124", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3741733124.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2454118835_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2454118835", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2454118835.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1740139011_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1740139011", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1740139011.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2528326030_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2528326030", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2528326030.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3247891773_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3247891773", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3247891773.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0715218494_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0715218494", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0715218494.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3431503226_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3431503226", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3431503226.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0777293315_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0777293315", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0777293315.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3311613184_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3311613184", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3311613184.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0411896949_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0411896949", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0411896949.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3484265347_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3484265347", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3484265347.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0311926450_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0311926450", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0311926450.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0964042442_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0964042442", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0964042442.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1448070530_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1448070530", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1448070530.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1546001592_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1546001592", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1546001592.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0361987122_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0361987122", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0361987122.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3363652935_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3363652935", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3363652935.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3725013301_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3725013301", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3725013301.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0592117316_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0592117316", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0592117316.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0072000889_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0072000889", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0072000889.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3602150900_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3602150900", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3602150900.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0316988751_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0316988751", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0316988751.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0666840697_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0666840697", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0666840697.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2356222515_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2356222515", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2356222515.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0696541383_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0696541383", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0696541383.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3893018375_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3893018375", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3893018375.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2545045951_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2545045951", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2545045951.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3872379163_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3872379163", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3872379163.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1911085318_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1911085318", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1911085318.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0237204547_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0237204547", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0237204547.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2470936962_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2470936962", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2470936962.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1446809215_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1446809215", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1446809215.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3976163130_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3976163130", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3976163130.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0151894565_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0151894565", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0151894565.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2546012738_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2546012738", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2546012738.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2721951437_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2721951437", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2721951437.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1518615073_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1518615073", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1518615073.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3092783448_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3092783448", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3092783448.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1584523804_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1584523804", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1584523804.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2944053649_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2944053649", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2944053649.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3041284383_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3041284383", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3041284383.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2284029367_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2284029367", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2284029367.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1085856431_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1085856431", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1085856431.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2981331234_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2981331234", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2981331234.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2362856842_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2362856842", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2362856842.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1742859913_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1742859913", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1742859913.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2824110071_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2824110071", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2824110071.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2959476422_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2959476422", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2959476422.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3171628412_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3171628412", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3171628412.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2713706381_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2713706381", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2713706381.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3018094470_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3018094470", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3018094470.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1613824077_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1613824077", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1613824077.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4191381068_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4191381068", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4191381068.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4030252598_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4030252598", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4030252598.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3266567108_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3266567108", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3266567108.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0818166330_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0818166330", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0818166330.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1532083653_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1532083653", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1532083653.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4031481291_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4031481291", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4031481291.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1889204938_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1889204938", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1889204938.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3504894927_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3504894927", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3504894927.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3251593655_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3251593655", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3251593655.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0772606601_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0772606601", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0772606601.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1225397710_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1225397710", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1225397710.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2415094643_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2415094643", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2415094643.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4017954426_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4017954426", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4017954426.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1316861107_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1316861107", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1316861107.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0291941391_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0291941391", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0291941391.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0945666444_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0945666444", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0945666444.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3071387579_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3071387579", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3071387579.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2653598264_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2653598264", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2653598264.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1846169331_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1846169331", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1846169331.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2177377741_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2177377741", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2177377741.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1795137230_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1795137230", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1795137230.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2667648382_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2667648382", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2667648382.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1953442551_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1953442551", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1953442551.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2611823049_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2611823049", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2611823049.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1891860032_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1891860032", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1891860032.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2673381876_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2673381876", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2673381876.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3690168633_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3690168633", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3690168633.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0875686407_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0875686407", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0875686407.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2598330885_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2598330885", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2598330885.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3120489793_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3120489793", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3120489793.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3558712306_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3558712306", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3558712306.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0705040775_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0705040775", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0705040775.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1662271156_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1662271156", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1662271156.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3951611463_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3951611463", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3951611463.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2235430384_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2235430384", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2235430384.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1017670065_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1017670065", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1017670065.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4247172721_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4247172721", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4247172721.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1690620016_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1690620016", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1690620016.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2773094320_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2773094320", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2773094320.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1059723505_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1059723505", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1059723505.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0892373558_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0892373558", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0892373558.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2798157552_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2798157552", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2798157552.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1732682032_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1732682032", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1732682032.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4272211761_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4272211761", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4272211761.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2290403854_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2290403854", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2290403854.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0461127368_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0461127368", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0461127368.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1990162555_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1990162555", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1990162555.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0370216306_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0370216306", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0370216306.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3617575602_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3617575602", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3617575602.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3673350408_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3673350408", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3673350408.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0835017227_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0835017227", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0835017227.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3546940047_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3546940047", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3546940047.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2332474190_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2332474190", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2332474190.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3317988025_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3317988025", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3317988025.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1964837179_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1964837179", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1964837179.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4199618316_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4199618316", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4199618316.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0834017782_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0834017782", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0834017782.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2138363905_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2138363905", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2138363905.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3640906677_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3640906677", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3640906677.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2171562612_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2171562612", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2171562612.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1088533940_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1088533940", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1088533940.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2527988190_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2527988190", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2527988190.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2037146336_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2037146336", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2037146336.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2938320155_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2938320155", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2938320155.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1142197784_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1142197784", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1142197784.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2672142756_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2672142756", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2672142756.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1850667561_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1850667561", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1850667561.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1088511525_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1088511525", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1088511525.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2612033945_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2612033945", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2612033945.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2173475095_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2173475095", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2173475095.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1887945370_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1887945370", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1887945370.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2107224797_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2107224797", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2107224797.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1953632935_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1953632935", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1953632935.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3087115730_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3087115730", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3087115730.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1399822939_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1399822939", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1399822939.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3165516133_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3165516133", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3165516133.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1472450284_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1472450284", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1472450284.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3541647730_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3541647730", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3541647730.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1469729382_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1469729382", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1469729382.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2882987302_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2882987302", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2882987302.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2037471920_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2037471920", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2037471920.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2721924444_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2721924444", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2721924444.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1225457247_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1225457247", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1225457247.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0012547396_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0012547396", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0012547396.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2798163297_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2798163297", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2798163297.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0054330372_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0054330372", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0054330372.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1308569186_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1308569186", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1308569186.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1604611576_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1604611576", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1604611576.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3326479353_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3326479353", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3326479353.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4106114550_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4106114550", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4106114550.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1388928578_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1388928578", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1388928578.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0130602041_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0130602041", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0130602041.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3241257604_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3241257604", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3241257604.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2573013829_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2573013829", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2573013829.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1970162374_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1970162374", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1970162374.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3204057025_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3204057025", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3204057025.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0655909312_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0655909312", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0655909312.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3868638720_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3868638720", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3868638720.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3034617094_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3034617094", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3034617094.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2645083000_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2645083000", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2645083000.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0762425594_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0762425594", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0762425594.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1775935543_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1775935543", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1775935543.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1004521676_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1004521676", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1004521676.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1672704269_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1672704269", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1672704269.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_2020620929_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_2020620929", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_2020620929.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_3029587707_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_3029587707", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_3029587707.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1919592518_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1919592518", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1919592518.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1250452622_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1250452622", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1250452622.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1308607987_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1308607987", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1308607987.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_4161200552_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_4161200552", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_4161200552.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_1490275461_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_1490275461", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_1490275461.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_04567189716726560339_1692233196_0787726778_init()
{
	static char *pe[] = {(void *)NetDecl_36_0,(void *)Gate_38_1};
	xsi_register_didat("simprims_ver_m_04567189716726560339_1692233196_0787726778", "isim/KGPRISC_tb_isim_par.exe.sim/simprims_ver/m_04567189716726560339_1692233196_0787726778.didat");
	xsi_register_executes(pe);
}
