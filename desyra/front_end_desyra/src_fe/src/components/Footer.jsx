import React from 'react';
import { Link } from 'react-router-dom';
import '../style/footer.css'; // Se vuoi modularizzare meglio lo stile

function Footer() {
  return (
    <footer className="footer">
      <div className="footer-columns">

        <div className="footer-col">
          <Link to="/contact">Contact Us</Link>
          <Link to="/shipping">Shipping</Link>
          <Link to="/returns-repairs">Returns & Repairs</Link>
          <Link to="/faqs">FAQs</Link>
          <Link to="/warranty-policy">Warranty Policy</Link>
          <Link to="/terms">Terms & Conditions</Link>
          <Link to="/privacy">Privacy Policy</Link>
          <Link to="/cookies">Cookies Policy</Link>
        </div>

        <div className="footer-col">
          <Link to="/brand-profile">Brand Profile</Link>
          <Link to="/stores">Stores</Link>
          <Link to="/philanthropy">Philanthropy</Link>
          <Link to="/recycling">Recycling</Link>
          <Link to="/care-guide">Care Guide</Link>
          <Link to="/careers">Careers</Link>
        </div>

        <div className="footer-col">
          <a href="https://instagram.com" target="_blank" rel="noopener noreferrer">Instagram</a>
          <a href="https://facebook.com" target="_blank" rel="noopener noreferrer">Facebook</a>
          <a href="https://pinterest.com" target="_blank" rel="noopener noreferrer">Pinterest</a>
        </div>

        <div className="footer-col subscribe">
          <h4>Join the List</h4>
          <p>Receive updates on new arrivals, exclusive events, store openings, news and more.</p>
          <input type="email" placeholder="Email address" />
        </div>
      </div>

      <div className="footer-bottom">
        <p>© DESYRA 2025</p>
        <p className="footer-description">
          &Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic, vero saepe! Iste voluptatem officiis voluptates amet laborum molestiae voluptatum ipsam numquam enim est aspernatur, quis similique autem cum dolore sunt.
        </p>
      </div>
    </footer>
  );
}

export default Footer;
