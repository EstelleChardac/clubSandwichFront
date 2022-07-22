import 'react-toastify/dist/ReactToastify.css';

import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { toast, ToastContainer } from 'react-toastify';

import INewsletterSubscriber from '../../interfaces/INewsletterSubscriber';
import IPage from '../../interfaces/IPage';

interface NewsletterProps {
  id: number;
}

const Newsletter = ({ id }: NewsletterProps) => {
  // Defining the form inputs variables and functions and intializing them to blank
  const [userMail, setUserMail] = useState<string>('');
  // JE CRÉE UN USESTATE AFIN DE STOCKER LA DATA ISSU DE L'APPEL AXIOS DANS CONTENT
  const [content, setContent] = useState<IPage>();

  // Appel API Axios pour ajouter le newsletter subscriber
  const handleSubmitMail = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      await axios.post<INewsletterSubscriber>(
        `${import.meta.env.VITE_API_URL}/api/newsletterSubscribers`,
        { email: userMail },
      );
      setUserMail('');
      toast('Vous êtes bien inscrit-e à la newsletter');
    } catch (err) {
      toast(`Désolé, l'inscription n'a pas fonctionné`);
    }
  };

  // APPEL API AXIOS
  const getContent = async () => {
    const url: string = `${import.meta.env.VITE_API_URL}/api/pages/${id}`;
    const { data } = await axios.get<IPage>(url);
    setContent(data);
  };

  // AU CHARGEMENT DU COMPOSANT, J'EXÉCUTE LA FONCTION GETCONTENT
  useEffect(() => {
    getContent();
  }, []);

  return (
    <>
      <div className="newsletterSection">
        <div className="newsletterSection__content">
          <h1 className="newsletterSection__content__outLine">TROP DE LOVE</h1>
          <h1 className="newsletterSection__content__title1">On aime</h1>
          <h2 className="newsletterSection__content__title2">
            rigoler, le bon son, bien manger, boire
          </h2>
          <h3 className="newsletterSection__content__title3">ET VOUS.</h3>
          <p className="newsletterSection__content__text1">{content?.description}</p>
          <p className="newsletterSection__content__text2">
            Pour une dose mensuelle de news de Club Sandwich, on t&apos;invite à saisir ta
            plus belle adresse mail ci-dessous. Promis, on ne spam pas et ton mail ne sera
            utilisé que pour cela (t&apos;as vu ça rime). On t&apos;embrasse !
          </p>
        </div>
        <form
          className="newsletterSection__form__group field"
          autoComplete="off"
          onSubmit={(e) => handleSubmitMail(e)}>
          <input
            type="email"
            className="newsletterSection__form__field"
            placeholder="Ci-gît ton adresse mail"
            name="email"
            id="email"
            required
            autoComplete="false"
            value={userMail}
            onChange={(e) => {
              setUserMail(e.target.value);
            }}
          />
          <button
            type="submit"
            className="newsletterSection__form__group__buttonNewsletter"
            area-hidden="true"
            onClick={toast}>
            JE VEUX LA NEWSLETTER
          </button>
          <ToastContainer
            position="bottom-right"
            autoClose={5000}
            hideProgressBar={false}
            newestOnTop={false}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover
          />
        </form>
      </div>
    </>
  );
};

export default Newsletter;
