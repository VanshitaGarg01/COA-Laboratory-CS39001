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
static const char *ng0 = "/home/vanshita/COA-Laboratory-CS39001/Assn-7/KGPRISC_tb.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static const char *ng3 = "Content in register 19: %d";
static int ng4[] = {19, 0};
static const char *ng5 = "Element not found.";
static const char *ng6 = "Element found at index: %d";



static void Initial_23_0(char *t0)
{
    char t7[8];
    char t17[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;

LAB0:    t1 = (t0 + 2360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);

LAB4:    xsi_set_current_line(25, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(26, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(27, ng0);
    t2 = (t0 + 2168);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(27, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1448);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2168);
    xsi_process_wait(t2, 2905000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 4448);
    t4 = *((char **)t3);
    t5 = ((((char*)(t4))) + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 4496);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 72U);
    t11 = *((char **)t10);
    t12 = (t0 + 4544);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 64U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t7, 32, t6, t11, t15, 1, 1, t16, 32, 1);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)119, t7, 32);
    xsi_set_current_line(32, ng0);
    t2 = (t0 + 4592);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 4640);
    t8 = *((char **)t6);
    t9 = ((((char*)(t8))) + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 4688);
    t12 = *((char **)t11);
    t13 = ((((char*)(t12))) + 64U);
    t14 = *((char **)t13);
    t15 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t7, 32, t5, t10, t14, 1, 1, t15, 32, 1);
    t16 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_signed_unary_minus(t17, 32, t16, 32);
    memset(t18, 0, 8);
    xsi_vlog_signed_equal(t18, 32, t7, 32, t17, 32);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(34, ng0);

LAB11:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 4736);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 4784);
    t8 = *((char **)t6);
    t9 = ((((char*)(t8))) + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 4832);
    t12 = *((char **)t11);
    t13 = ((((char*)(t12))) + 64U);
    t14 = *((char **)t13);
    t15 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t7, 32, t5, t10, t14, 1, 1, t15, 32, 1);
    xsi_vlogfile_write(1, 0, 0, ng6, 2, t0, (char)119, t7, 32);

LAB9:    xsi_set_current_line(37, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

LAB7:    xsi_set_current_line(32, ng0);

LAB10:    xsi_set_current_line(33, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    goto LAB9;

}

static void Always_48_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 2608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);

LAB4:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2416);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 1288);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB10:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1288);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

LAB11:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB10;

}


extern void work_m_02199740068577276398_2074985839_init()
{
	static char *pe[] = {(void *)Initial_23_0,(void *)Always_48_1};
	xsi_register_didat("work_m_02199740068577276398_2074985839", "isim/KGPRISC_tb_isim_beh.exe.sim/work/m_02199740068577276398_2074985839.didat");
	xsi_register_executes(pe);
}
