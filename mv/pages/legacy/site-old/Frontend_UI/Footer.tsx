import Link from 'next/link';

const FooterLink = ({ href, children }: { href: string; children: React.ReactNode }) => (
  <Link href={href} className="text-gray-500 hover:text-gray-900 transition-colors text-sm">
    {children}
  </Link>
);

export default function Footer() {
  return (
    <footer className="bg-gray-100 border-t mt-16">
      <div className="container mx-auto px-6 py-12">
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-8">
          <div className="col-span-2 lg:col-span-1">
            <h3 className="text-lg font-bold text-blue-600">Ophelia</h3>
            <p className="text-sm text-gray-500 mt-2">Your one-stop shop for everything.</p>
          </div>

          <div>
            <h4 className="font-semibold text-gray-800">Account</h4>
            <div className="mt-4 flex flex-col space-y-2">
              <FooterLink href="#">Sign In</FooterLink>
              <FooterLink href="#">Order Status</FooterLink>
              <FooterLink href="#">My Wishlist</FooterLink>
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-gray-800">About Us</h4>
            <div className="mt-4 flex flex-col space-y-2">
              <FooterLink href="#">Our Company</FooterLink>
              <FooterLink href="#">Careers</FooterLink>
              <FooterLink href="#">Store Locator</FooterLink>
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-gray-800">Customer Service</h4>
            <div className="mt-4 flex flex-col space-y-2">
              <FooterLink href="#">Help Center</FooterLink>
              <FooterLink href="#">Returns & Exchanges</FooterLink>
              <FooterLink href="#">Shipping Information</FooterLink>
              <FooterLink href="#">Contact Us</FooterLink>
            </div>
          </div>
        </div>
        <div className="mt-12 border-t pt-8 text-center text-sm text-gray-500">
          <p>&copy; {new Date().getFullYear()} Ophelia Retail, Inc. All Rights Reserved.</p>
        </div>
      </div>
    </footer>
  );
}