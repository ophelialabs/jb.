import Link from 'next/link';
import { Search, ShoppingCart, User, Menu } from 'lucide-react';

export default function Header() {
  return (
    <header className="bg-white shadow-md sticky top-0 z-10">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <div className="flex items-center space-x-6">
            <Link href="/" className="text-2xl font-bold text-blue-600">
              Ophelia
            </Link>
            <nav className="hidden md:flex items-center space-x-4">
              <button className="flex items-center font-semibold text-gray-700 hover:text-blue-600">
                <Menu size={20} className="mr-1" />
                Departments
              </button>
              <Link href="#" className="font-semibold text-gray-700 hover:text-blue-600">Deals</Link>
              <Link href="#" className="font-semibold text-gray-700 hover:text-blue-600">New Arrivals</Link>
            </nav>
          </div>

          <div className="flex-1 max-w-xl mx-4">
            <div className="relative">
              <input type="search" placeholder="Search for products..." className="w-full border-2 border-gray-300 bg-gray-100 h-10 px-5 pr-10 rounded-full text-sm focus:outline-none focus:border-blue-500" />
              <button type="submit" className="absolute right-0 top-0 mt-3 mr-4">
                <Search size={20} className="text-gray-500" />
              </button>
            </div>
          </div>

          <div className="flex items-center space-x-4">
            <Link href="#" className="flex items-center text-gray-700 hover:text-blue-600"><User size={24} /><span className="hidden lg:inline ml-1 font-semibold">Sign In</span></Link>
            <button className="relative flex items-center text-gray-700 hover:text-blue-600">
              <ShoppingCart size={24} />
              <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">0</span>
            </button>
          </div>
        </div>
      </div>
    </header>
  );
}