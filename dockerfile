FROM centos:latest
LABEL Name="centos/pwcli"

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y install https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/powershell-6.0.2-1.rhel.7.x86_64.rpm && \    
    yum clean all  
    
RUN ["/opt/microsoft/powershell/6.0.2/pwsh", "-c", "& {Install-Module -Name VMware.PowerCLI -Scope CurrentUser -force}" ]   

CMD [ "/opt/microsoft/powershell/6.0.2/pwsh" ]