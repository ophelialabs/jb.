Pulling vSphere World Metrics from VCF Operations via API
Writer: Brock Peterson
[Brock Peterson](https://www.brockpeterson.com/)
Aug 18

vSphere World is a powerful construct in VCF Operations, I think of it as the bucket that contains everything.  For example, maybe you want to see the number of Clusters, ESXi Hosts, and VMs in your environment.  Those are just metrics on the vSphere World object, like this.


ree


You can pull these metrics from the VCF Operations API surface, here's how.  Go to https://vcfoperationsfqdnhere/suite-api and authenticate.

Authenticating with the Aria Operations API
Writer: Brock Peterson
Brock Peterson
Oct 14, 2024

The Aria Operations API is a powerful way of interacting programatically with Operations.  There are several ways to authenticate with the API, let's explore them here.


First, the Operations API can be accessed at the following URL:  https://operations_ip_or_fqdn/suite-api


The easiest way is local authentication via the Authorize button top right of the API home page, which you can do like this.




The Authorize button issues a POST /suite-api/api/auth/token/acquire and caches that Bearer Token for use within the Swagger UI.  Similar to generating a Bearer Token like this, see the Response Body at the bottom.

ree


You could acquire your Bearer Token via an API tool like Postman as well, like this.

ree

You can use this Bearer Token in the Authorization tab of all subsequent calls (at least until it expires).


If you'd like to use Basic Authentication you'll have to enable it like this.  As you can see Basic Auth is currently disabled in my environment and thus my request is failing.





I've adjusted basicAuthentication.enabled=true and cycled the API service via "service api restart" and retried. Repeat steps 1-5 on all other nodes in the vRealize Operations cluster.





As you can see in the Response Body, we got a list of Super Metrics as desired.  The Operations API is very powerful, use it!

ree


There are other ways to do this, which we've discussed previously here.  Once authenticated, you'll need the vSphere World ResourceId, which you can find via GET /api/resources with the ResourceKind of vSphere World.  My call looks like this.


ree


Scroll down and click Execute to run it, which will give you the associated Curl command as well.


ree


The identifier is at the bottom, this is what we'll use to get the metrics we want from vSphere World, but first we need to determine the StatKeys, which I think of as the metrics themselves.  Do this with GET /api/resources/statkeys and your resourceId, mine looks like this.  Note: you can use the searchstring field if you know what you want, for example I might have used total here.


ree


We now have the StatKeys for the metrics we want:

Clusters: summary|total_number_clusters

ESXi Hosts: summary|total_number_hosts

VMs: summary|total_number_vms


Now we can get the latest values for them by using GET /api/resources/stats/latest as follows.


ree


Notice I provided the resourceId for vSphere World and the statKeys we previously captured.


ree


Click Execute and you'll be given the latest values (along with the Curl command if you wany to use that elsewhere).


ree


Now if you compare these to the latest values in the UI, they match!


ree


This same methodology can be used to pull metrics/properties against any object you want.  Use the VCF Operations API, it's powerful!