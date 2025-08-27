# fedora-bootc-gitops-hardened


## Use Toolbx to perform CIS Scan

Login as sudo user on bootc VM.
   ```
toolbox create

toolbox enter
   ```

Install OpenSCAP and perform scan:

   ```
dnf install -y openscap-scanner scap-security-guide

oscap info --profiles /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml

oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cusp_fedora --results scan_results.xml --report scan_report.html /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml
   ```

Copy the results to the 'host' /root folder:
   ```
cp scan_* /run/host/root/
   ```

## Actually Toolbox does not work

Use bootc usr-overlay

   ```
sudo -i
bootc usr-overlay
dnf install -y openscap-scanner scap-security-guide

oscap info --profiles /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml

oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cusp_fedora --results scan_results.xml --report scan_report.html /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml
dnf install -y openscap-scanner scap-security-guide


oscap info --profiles /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml

oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cusp_fedora --results scan_results.xml --report scan_report.html /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml

dnf remove -y openscap-scanner scap-security-guide

## References

* https://docs.fedoraproject.org/en-US/bootc/debugging-toolbx/
* https://www.redhat.com/en/blog/center-internet-security-cis-compliance-red-hat-enterprise-linux-using-openscap



