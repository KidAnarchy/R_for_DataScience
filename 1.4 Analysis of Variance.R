#--------------------------------------------------------------
#                Analysis of Variance
#--------------------------------------------------------------
#�����駢ͧ�� 4 ��Դ�Ф�Ѻ�·��ͧ����������شط����� 16 ���
#����դس�ѡɳ�����͹�ѹ��� 16 ��鹹Ф�Ѻ�����������������ʴ�
#�������������駢ͧ�մѧ���ҧ��Ѻ�ҡ��鹨��ҷӡ�÷��ͺ����շ�� 4 ��Դ
#���������ҡ�����������ᵡ��ҧ�ѹ����������дѺ����Ӥѭ 0.05
time = c(31,30,28,28,32,33,29,31,28,29,29,30,26,27,26,27)
type = c('A','A','A','A','B','B','B','B','C','C','C','C','D','D','D','D')

data = data.frame(time, type)
data

summary(aov(lm(time~type,data)))
#�ѧࡵط���� p-value ��ҧ��ҧ�Ф�Ѻ����ҡѺ 0.00148��觹��¡����дѺ����Ӥѭ 0.05
#�֧����ʸ���ص԰ҹ��ѡ�����ػ������շ�� 4 ��Դ�Ф�Ѻ���������ҡ�����������ᵡ��ҧ�ѹ���ҧ���� 1 ���


#���ҵ�ͧ��÷�Һ����դ���˹��ҧ����ѹ�դ�������ᵡ��ҧ�ѹ
#��ҡ�����Ըա�÷��ͺ�١��Ф�Ѻ
TukeyHSD(aov(time~type,data))

#�������Ҵټź�÷Ѵ�á������º��º�������ҡ���������¢ͧ�� B ��� A �Ф�Ѻ
#���� p-value ��ҡѺ 0.1579 �Ф�Ѻ����ҡ�����дѺ����Ӥѭ 0.05
#�֧����Ѻ���ص԰ҹ��ѡ�����ػ����� A ����� B ���������ҡ��������������ᵡ��ҧ�ѹ

#�շ�����������ҡ����������ᵡ��ҧ�ѹ��� �� A �Ѻ�� D����� D �Ѻ�� B �Ф�Ѻ


#------------------------------------------------------------
#         ���������������û�ǹ�ͧ�ҧ
#------------------------------------------------------------
# �ç�ҹ��Ե�Թ������˹�������˹�ҷ��������ͧ�ѡ����� 3 ���������ͧ�ѡ÷�����Ե���� 4 ����ͧ
# ���ص����������ͧ�ѡ� A, B, C, D �Ф�Ѻ㹡�÷��ͺ����Է���Ҿ㹡�÷ӧҹ�ͧ���˹�ҷ���������ͧ�ѡ÷�����
# ��������˹�ҷ�����Ф��������ͧ�ѡ÷ء � ����ͧ�����Ѵ�ӹǹ�Թ��ҷ���Ե���ҡ��Ŵѧ���ҧ��Ѻ
# �ҡ��鹡��������������ŷ���дѺ����Ӥѭ 0.05
output = c(202,78,112,248,210,82,110,246,194,77,105,232)
machine = c('A','A','A','A','B','B','B','B','C','C','C','C')
man = c('1','2','3','4','1','2','3','4','1','2','3','4')

data = data.frame(output, machine, man)
data

#anova(lm(output~machine+man, data))��觨��ռ��Ѿ������ 2 ��÷Ѵ ��� man �Ѻ machine
#�ҡ�������ѧࡵؤ�� p-value �ͧ machine ��͹�Ф�Ѻ������ҡѺ 0.027
#��觹��¡����дѺ����Ӥѭ 0.05�֧��ػ����һ���ҳ�Թ��ҷ���Ե���������
#�ͧ����ͧ�ѡ÷�� 3 ����ͧᵡ��ҧ�ѹ�Ф�Ѻ�����Ҩ�С�������������ͧ�ѡ÷�������Է�Ծŵ�ͻ������Թ��ҷ���Ե��

#���������ѧࡵؤ�� p-value �ͧ man ������ҡѺ 1.299e-0.8
#���� 1.299 x 10 ¡���ѧź 8 ��觡���¡����дѺ����Ӥѭ 0.05
#�֧��ػ����һ���ҳ�Թ��ҷ���Ե��������¨ҡ���˹�ҷ���� 4 ��
#�դ��ᵡ��ҧ�ѹ

#------------------------------------------------

# ��㹺ҧ���駻Ѩ��·��˹�����ͻѨ��·���ͧ����ռ������ռšѺ��ҷ������֡�ҹ����ҡ
# ��͹��ͧ�Ѩ���������ѹ�����Ҩ���ռšѺ��ҷ�����ʹ��֡�� ������¡����Է�Ծ�����


#¡������ҧ�� 㹡�����Ǩ��ṹ�ͺ�Ԫ�ʶԵԢͧ�ѡ�֡�Ҥ�� A, B, C 3 ��йФ�Ѻ
#���ӡ�����Ǩ��ͧ��÷�Һ��ҹѡ�֡�ҷ�� 3 ��� �դ���ᵡ��ҧ�ѹ���������йѡ�֡�ҷ���繪������˭ԧ�зӤ�ṹ�ͺ�觡��ҡѹ�������Ф�Ѻ
#�֧���͡������ҧ�ѡ�֡�Ҫ����йѡ�֡��˭ԧ������ 5 �� �ҡ��� 3 ���������Ť�ṹ�ͺ�Ԫ�ʶԵ��繴ѧ���ҧ��Ѻ
#�ҡ��鹡稧������������ŷ���дѺ����Ӥѭ 0.05
score = c(34,19,24,36,25,27,24,19,33,37,16,35,18,16,12,41,30,17,27,22,30,28,39,29,24,28,34,40,27,42)
sex = c('M','M','M','M','M','F','F','F','F','F','M','M','M','M','M','F','F','F','F','F','M','M','M','M','M','F','F','F','F','F')
fac = c('A','A','A','A','A','A','A','A','A','A','B','B','B','B','B','B','B','B','B','B','C','C','C','C','C','C','C','C','C','C')

data = data.frame(score,sex,fac)
data

#���ͨ�͸Ժ�º͡�������ҵ��Ẻ��ͤ�� score ���üѹ����Է�ԾŢͧ sex
#���ỹ�ѹ����Է�ԾŢͧ faculty ��ͤ����С��ѧ���Է�Ծ������ͧ sex �Ѻ faculty ����
anova(lm(score~sex*fac,data))

# ���ǹ���������Ҵ٤�� p-value ��� 3 ��ҹФ�Ѻ��Ҩо���� p-value ��� 3 ����ҡ�����дѺ����Ӥѭ 0.05
# �֧��ػ�������, ��з�����¹������Է�Ծŵ�ͤ�ṹ�ͺ��С�������Է�Ծ����������ҧ�ȡѺ��з�����¹�Ф�Ѻ

#--------------------------------------------------------------------------