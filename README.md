# fedora-bootc-gitops-hardened


## Scan Results:

Before hardening the following score was reported:

The target system did not satisfy the conditions of 18 rules! Please review rule results and consider applying remediation.


False positive: The toolbx container has rsync installed but the host not.

After hardening the following score was reported:

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

oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis --results scan_results.xml --report scan_report.html /usr/share/xml/scap/ssg/content/ssg-fedora-ds.xml
   ```

Copy the results to the 'host' /root folder:
   ```
cp scan_* /run/host/root/
   ```

## References

* https://docs.fedoraproject.org/en-US/bootc/debugging-toolbx/
* https://www.redhat.com/en/blog/center-internet-security-cis-compliance-red-hat-enterprise-linux-using-openscap



