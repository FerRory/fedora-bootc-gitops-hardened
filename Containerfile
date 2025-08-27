FROM ghcr.io/ferrory/fedora-bootc-gitops:latest
 
RUN echo -e "Defaults timestamp_timeout=5\nDefaults use_pty\nDefaults logfile=/var/log/sudo.log" >> /etc/sudoers

#RUN sed -i --follow-symlinks "s/^ENCRYPT_METHOD\\>.*/ENCRYPT_METHOD SHA512/gi" "/etc/login.defs"
RUN sed '/^[[:space:]]*#[[:space:]]*auth[[:space:]]\+required[[:space:]]\+pam_wheel\.so[[:space:]]\+use_uid$/s/^[[:space:]]*#//' -i /etc/pam.d/su

RUN echo "umask 027" >> /etc/bashrc
RUN sed -i --follow-symlinks "s/^UMASK\\>.*/UMASK		027/gi" "/etc/login.defs"
RUN echo "umask 027" >> /etc/profile

RUN bootc container lint
