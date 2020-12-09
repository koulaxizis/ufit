# uFit (Ubuntu Fit)
## Dead-simple script to clean up [Ubuntu-based](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Ubuntu-based) distros.
### Keep your system updated, healthy and fit. :slightly_smiling_face:

#### How-To
- Download the script (*uFit.sh*).
- Right click → Permissions → Properties → Allow executing file as program.
- Click it and choose "Run in Terminal".
- Enter your user password.
- Enjoy!

#### What it does
- Updates all DEB, SNAP and FLATPAK applications.
- Fixes any missing dependencies or broken packages.
- Shrinks systemd's journal to a maximum of 100 MB.
- Uses preload to speed up application load time.
- Removes dependencies that are no longer required.
- Removes orphaned packages and orphaned libraries.
- Removes old kernels that are no longer required.
- Removes all packages kept in the apt cache.
- Removes all data kept in the thumbnail cache.
- Removes all unused flatpak runtimes.
- Removes old versions on installed snaps.
- Removes trashed files older than 30 days.
- Removes extra localization of installled packages.

#### Attention
If snapd isn't installed, the script will end unexpectedly. However, commands about Snap are at the very end, so all of the rest commands will have been executed successfully. Not sure (yet) how to fix that. Feel free to help if you know how. Alternatively, edit the script with your favorite text editor, remove `sudo snap refresh` and `sudo snap set system refresh.retain=2`, save and run it!

**Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. :wink:**

##### Last but not least: If you find this script useful, consider making a small [donation](https://paypal.me/koulaxizis) to support me. Thanks! :heart:

![https://github.com/koulaxizis/ufit/blob/master/Banner.png]
